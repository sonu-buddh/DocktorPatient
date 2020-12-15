class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def salary
    @column = params[:column]
  end

  def calculate_salary
    amount = params[:amount].to_i
    svalue = params[:svalue].to_f
    value = (amount / svalue)
    column = (value % 12).round
    redirect_to home_salary_path(column: column)
  end
  
end
