class PatientsController < ApplicationController
  before_action :load_patient, only: [:edit, :update, :destroy]
  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.create(patient_params)
    if @patient.save
      redirect_to new_patient_path, notice: "Patient Successfully Created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to patients_path, notice: "Patient Successfully Updated"
    else
      render :edit
    end
  end

  def destroy
    if @patient.destroy
      redirect_to patients_path, notice: "Patient Successfully Deleted"
    else
      redirect_to patients_path
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :cpf, :birth_date)
  end

  def load_patient
    @patient = Patient.find(params[:id])
  end
end
