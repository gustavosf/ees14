class User
  include Mongoid::Document
  include Mongoid::Timestamps # Inclui e treta os campos created_at e updated_at

  field :email, type: String
  field :password, type: Mongoid::EncryptedString
  field :name, type: String
  field :access, type: String
  field :active, type: Integer, default: 1
  field :last_login, type: DateTime

  validates_presence_of :email
  validates_presence_of :name
  validates_presence_of :access
  validates_presence_of :password, :on => :create

  before_create :generate_default_password

  def authenticate(password)
    if password == self.password then
      last_login = Time.now
      save
      return true
    else
      return false
    end
  end

  protected

  def generate_default_password
    # Vamos usar o email como password default por enquanto
    self.password = email
  end

end
