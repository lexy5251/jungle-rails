class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :first_name, :last_name, :email, :password, :password_confirmation

  validates :email, uniqueness: {case_sensitive: false}

  validates :password, confirmation: true, length: {minimum: 4}

  def self.authenticate_with_credentials (email, password)
    email = email.downcase.strip
    @user = User.find_by(email: email)

    if @user && @user.try(:authenticate, password)
      @user
    else
      nil
    end
  end

end
