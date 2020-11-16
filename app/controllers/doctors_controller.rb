class DoctorsController < ApplicationController
  before_action :load_doctor, only: [:edit, :update, :destroy]
  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    doctor = Doctor.create(doctor_params)
    doctor.crm_uf.downcase
    if doctor.save!
      redirect_to doctors_path, notice: "Doctor Successfully Created"
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
    if @doctor.destroy
      redirect_to doctors_path, notice: "Doctor Successfully Deleted"
    else
      render doctors_path, notice: @doctor.errors.messages
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :crm, :crm_uf)
  end

  def save_doctor!
    if @category.save!
      render :index
    else
      render :new
    end
  end

  def load_doctor
    @doctor = Doctor.find(params[:id])
  end
end
