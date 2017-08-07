class User < ActiveRecord::Base

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 4 }

  has_secure_password
  # Takes password and password confirmation, makes sure they match,
  # converts to a single password_digest then saves that to the database.

  has_many :reviews

  def self.authenticate_with_credentials(email, password)
    email.downcase!
    email.strip!
    @user = User.find_by_email(email)
    if @user
      @user.authenticate(password)
      # Pass authenticate method for password of that user.
      # If true will return entire user object.
    else
      nil
  end

end
end