class ServicesController < ApplicationController
  # before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all
    # @users = @services.map do |service|
      # user = service.appointment.user if service.appointment && service.appointment.user && !service.appointment.user.nil?
  # end
    if @services
      render json: {
        services: @services,
        # users: @users
      }
    else
      render json: {
        status: 500,
        errors: ['no services found']
      }
    end
  end

  def new
    @service = Service.new
  end

  def create
    # @current_user.services << service
    if service = Service.create(service_params)
      render json: {
        service: service,
        status: :created
      }
    else
      render json: {
        status: 500,
        errors: ['service did not add']
      }

   end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    service = Service.find(params[:id])
    if service.update service_params
    # @current_user.services << service
    render json: {
      service: service
    }
  else
    render json: {
      status: 500,
      errors: ['service did not update']
    }
    end
  end

  def show
    @service = Service.find(params[:id])
    if @service
      render json: {
        service: @service
      }
    else
      render json: {
        status: 500,
        errors: ['service not found']
      }
    end
  end

  def destroy
    service = Service.find(params[:id])
    service.destroy

  end

  private

  def service_params
    params.require(:service).permit(:title, :duration, :cost, :description)
  end
end
