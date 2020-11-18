class AppointmentsController < ApplicationController
  before_action :load_appointment, only: [:edit, :update, :destroy]
  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.create(appointment_params)
    if @appointment.save
      redirect_to new_appointment_path, notice: "Appointment Successfully Created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to new_appointment_path, notice: "Appointment Successfully Updated"
    else
      render :edit
    end
  end

  def destroy
    if @appointment.destroy
      redirect_to appointments_path, notice: "Appointment Successfully Deleted"
    else
      render :index
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:starts_at, :ends_at, :patient_id, :doctor_id)
  end

  def load_appointment
    @appointment = Appointment.find(params[:id])
  end
end
