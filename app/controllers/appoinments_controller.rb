class AppoinmentsController < ApplicationController
  before_action :set_appoinment, only: [:approve_appoinment, :reject_appoinment, :show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    if current_user.patient?
      @appoinments = current_user.appoinments
    else
      @appoinments = Appoinment.where(doctor_id: current_user.id, status: 'pending')
    end
  end
  
  def show
  end

  def new
    @appoinment = Appoinment.new
  end

  def edit
  end

  def create
    @appoinment = Appoinment.new(appoinment_params)
    @appoinment.user_id = current_user.id
    @appoinment.status = 'pending'
    
    respond_to do |format|
      if @appoinment.save
        format.html { redirect_to @appoinment, notice: 'Appoinment was successfully created.' }
        format.json { render :show, status: :created, location: @appoinment }
      else
        format.html { render :new }
        format.json { render json: @appoinment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @appoinment.update(appoinment_params)
        format.html { redirect_to @appoinment, notice: 'Appoinment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appoinment }
      else
        format.html { render :edit }
        format.json { render json: @appoinment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @appoinment.destroy
    respond_to do |format|
      format.html { redirect_to appoinments_url, notice: 'Appoinment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approve_appoinment
    @appoinment.approve!
    redirect_to appoinments_path
  end
  
  def reject_appoinment
    @appoinment.reject!
    redirect_to appoinments_path
  end
  

  private
    def set_appoinment
      @appoinment = Appoinment.find(params[:id])
    end

    def appoinment_params
      params.require(:appoinment).permit(:start_time, :end_time, :user_id, :doctor_id, :status)
    end
end
