class AppointmentsController < ApplicationController

  # before_action :set_service, only: [:show, :edit, :update, :history]

def index
  @appointments = Appointment.all
  if @appointments
    render json: {
      appointments: @appointments
    }
  else
    render json: {
      status: 500,
      errors: ['no appointment found']
    }
  end
end

def new
  @appointment = Appointment.new
end

def create
  if appointment = Appointment.create(appointment_params)
    render json: {
      appointment: appointment,
      status: :created
    }
  else
    render json: {
      status: 500,
      errors: ['appointment did not created']
    }
  end
end

def edit
  @appointment = Appointment.find(params[:id])
end

def update
  appointment = Appointment.find(params[:id])
  appointment.update appointment_params
end

def show
  @appointment = Appointment.find(params[:id])
  if @appointment
    render json: {
      appointment: @appointment
    }
  else
    render json: {
      status: 500,
      errors: ['appointment not found']
    }
  end
end

def destroy
  appointment = Appointment.find(params[:id])
  appointment.destroy
end

private
def appointment_params
  params.require(:appointment).permit(:appointment_date, :location, :user_id, :service_id)
end
end
