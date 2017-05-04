class RegistrarPagesController < ApplicationController
  before_filter :authorize
  before_filter :redirect_if_not_registrar
  def home
  end
  
end