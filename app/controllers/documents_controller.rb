require 'csv'

class DocumentsController < ApplicationController
  before_filter :authorize
  before_filter :redirect_if_student_or_teacher
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    send_data(@document.file_contents,
            type: @document.content_type,
            filename: @document.filename)
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)
    if @document.save
      success = make_students_from_csv(@document.id)
      @document.destroy
      
      respond_to do |format|
        if success
          format.html { redirect_to portal_path, notice: 'Users were successfully created from .csv upload.' }
          # format.json { render :show, status: :created, location: @document }
        else
          format.html { redirect_to portal_path, :flash => { :error => 'Users were NOT successfully created from .csv upload.' } }
          # format.html { render :new }
          # format.json { render json: @document.errors, status: :unprocessable_entity }
        end
      end
    else
      format.html { redirect_to portal_path, :flash => { :error => 'Error: CSV document could not be uploaded.' } }
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  # Create new set of students from provided .csv file.
  # NOTE: .csv files must NOT have spaces following delimitting commas.
  def make_students_from_csv(id)
    success = true
    
    @document = Document.find(id)
    data = @document.file_contents
    CSV.parse(data) do |row|
      name = row[0]
      email = row[1]
      role = 0
      password = "norse"
      user = User.new(:name => name, :email => email, :role => role, :password => password)
      if user.save == false
        success = false
      end
    end
    return success
    # @document.destroy
    # redirect_to portal_path, :notice => "Users successfully created through .csv upload."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:file)
    end
end
