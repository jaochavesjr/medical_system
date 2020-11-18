class DoctorsController < ApplicationController
  before_action :load_doctor, only: [:edit, :update, :destroy]
  def index
    if params[:id]
      @doctor = Doctor.find(params[:id])
    end
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.create(doctor_params)
    if @doctor.save
      redirect_to new_doctor_path, notice: "Doctor Successfully Created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to doctors_path, notice: "Doctor Successfully Updated"
    else
      render :edit
    end
  end

  def destroy
    if @doctor.no_patient?
      @doctor.destroy
      redirect_to doctors_path, notice: "Doctor Successfully Deleted"
    else
      @doctors = Doctor.all
      @doctor
      render :index
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :crm, :crm_uf)
  end

  def load_doctor
    @doctor = Doctor.find(params[:id])
  end
end
