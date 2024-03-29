class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, 
  	:recoverable, :rememberable, :trackable, :validatable,:confirmable, authentication_keys: [:login]

	attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value OR lower(phone_number) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end

  protected
  def confirmation_required?
   false
  end
 
end
