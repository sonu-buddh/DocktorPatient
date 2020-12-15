class AvailabilitiesController < ApplicationController
  before_action :set_availability, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  include AvailabilitiesHelper

  def index
    # @availabilities = Availability.all
    today = Date.today
    start_date = today.beginning_of_week(start_day = :monday)
    end_date = today.end_of_week(start_day = :monday)
    @availabilities = Availability.where("start_time >= :start_date AND end_time <= :end_date", {start_date: start_date, end_date: end_date}).where(user_id: current_user.id, status: 'not_booked')
  end

  def show
  end

  def new
    @availability = Availability.new
  end

  def edit
  end

  def create
    start_time = params[:availability][:start_time]
    end_time = params[:availability][:end_time]
    today = Date.today
    time_slot  = create_time_slot(start_time, end_time)
    (today..today + 6.days).each do |date|
      time_slot.each do |time|
        @availability = Availability.new(availability_params)
        @availability.user_id = current_user.id
        @availability.available_date = date
        @availability.start_time = Time.at(time)
        @availability.end_time = Time.at(time) + 1.hour 
        @availability.status = "not_booked"
        @status = @availability.save
      end
    end
    respond_to do |format|
      if @status
        format.html { redirect_to @availability, notice: 'Availability was successfully created.' }
        format.json { render :show, status: :created, location: @availability }
      else
        format.html { render :new }
        format.json { render json: @availability.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @availability.update(availability_params)
        format.html { redirect_to @availability, notice: 'Availability was successfully updated.' }
        format.json { render :show, status: :ok, location: @availability }
      else
        format.html { render :edit }
        format.json { render json: @availability.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @availability.destroy
    respond_to do |format|
      format.html { redirect_to availabilities_url, notice: 'Availability was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_availability
      @availability = Availability.find(params[:id])
    end

    def availability_params
      params.require(:availability).permit(:available_date, :start_time, :end_time, :user_id)
    end
end
