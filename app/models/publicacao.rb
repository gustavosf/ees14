class Publicacao
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :_type

  field :ano, type: Integer
  field :titulo, type: String
  field :idioma, type: String
  field :link, type: String

  def self.types
    return ['periodico', 'livro', 'conferencia']
  end

  def self.get_instance_of_type(type)
    if type == 'periodico' then
      return Periodico.new
    elsif type == 'conferencia' then
      return Conferencia.new
    elsif type == 'livro' then
      return Livro.new
    end
  end

  def fill_with(params)
    params.each do |key,value|
      if self.class.method_defined? key then
        self[key] = value
       end
    end
  end
end
