class Conferencia < Publicacao
  field :conferencia, type: String
  field :isbn, type: String
  field :doi, type: String
  field :volume, type: String
  field :fasciculo, type: String
  field :edicao, type: String
  field :pag_inicial, type: Integer
  field :pag_final, type: Integer
  field :pais, type: String
  field :cidade, type: String
  field :autores, type: Array, default: []
end
