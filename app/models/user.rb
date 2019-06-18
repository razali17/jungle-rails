class User < ActiveRecord::Base

  has_secure_password
  validates :password, length: {minimum: 4}
  validates :first_name, presence: true
  validates :last_name, presence:true
  validates :email, uniqueness: {:message => "Already Exists!"}

  def self.authenticate_with_credentials(email, password)
    new_email = email.downcase
    user = User.find_by_email(new_email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
