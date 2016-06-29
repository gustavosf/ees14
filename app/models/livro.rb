class Livro < Publicacao
  field :doi, type: String
  field :editora, type: String
  field :volume, type: String
  field :edicao, type: String
  field :pais, type: String
  field :autores, type: Array, default: []
end
