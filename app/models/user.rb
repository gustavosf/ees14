class User
  include Mongoid::Document
  include Mongoid::Timestamps # Inclui e treta os campos created_at e updated_at

  field :email, type: String
  field :password, type: Mongoid::EncryptedString
  field :name, type: String
  field :access, type: Array, default: ['visitor']
  field :active, type: Integer
  field :last_login, type: DateTime

  # has_many :posts

  def self.get_current
  	User.find_by(email: session[:user_id]) if defined? session[:user_id]
  end
end
