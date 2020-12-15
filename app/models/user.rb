class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :appoinments
  has_many :avalabilities
  
  def doctor?
    self.role == "Doctor"
  end
  
  def patient?
    self.role == "Patient"
  end
  
  # Availability.joins(:users).where("available_date >= :start_date AND available_date <= :end_date", {start_date: start_date, end_date: end_date}).where(status: 'approved')
  # Availability.joins(:users).select("users.*, max(avalabilities.created_at) as most_recent, count(avalabilities.id) as users_count").group('users.id')
  # users = ActiveRecord::Base.connection.execute("SELECT id, name FROM users WHERE ").group(:id)
end