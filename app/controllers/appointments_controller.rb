class AppointmentsController < ApplicationController

  # before_action :set_service, only: [:show, :edit, :update, :history]

def index
  @appointments = Appointment.all
  @services = Service.all
  @users = User.all

  @new_app = @appointments.map do |appointment|
    @app_details = {
      service: Service.find(appointment.service_id),
      user: User.find(appointment.user_id),
      location: appointment.location,
      appointment_date: appointment.appointment_date,
      id: appointment.id
    }
  end

  if @appointments
    render json: {
      appointments: @appointments,
      new_app: @new_app
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

def appointment_user
  @user = User.find(params[:user_id])
  @appointments = Appointment.all
  @services = Service.all


  @user_appointments = @user.appointments

  @new_user_app = @user_appointments.map do |appointment|
    app_details = {
      location: appointment.location,
      appointment_date: appointment.appointment_date,
      id: appointment.id,
      service_id: appointment.service_id,
      user_id: appointment.user_id,
      service: Service.find(appointment.service_id)
    }
end


  if @user_appointments
    render json: {
      user_appointments: @user_appointments,
      new_user_app: @new_user_app
    } else
    render json: {
        status: 500,
        errors: ['no appointments found']
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
