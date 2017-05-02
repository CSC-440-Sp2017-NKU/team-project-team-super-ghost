class Breadcrumb
  attr_accessor :name, :path

  def initialize(name, path)
    @name = name
    @path = path
  end
  def name
    @name
  end
end
