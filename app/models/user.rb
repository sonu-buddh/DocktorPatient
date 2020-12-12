class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :appoinments
  has_many :availability

  def doctor?
    self.role == "Doctor"
  end

  def patient?
    self.role == "Patient"
  end
  
end