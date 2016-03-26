class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new

    respond_to do |format|
      format.html { render :index }
      format.js { render "success_trip" }
    end
  end


  def create
    @trip = Trip.new trip_params
    @trip.user = current_user

    if @trip.save
      redirect_to user_trips_path(current_user)
    else
      flash[:notice] = "Something is wrong"
      render :new
    end
  end


  private

  def trip_params
    params.require(:trip).permit(:title, 
                                 :country, 
                                 :city, 
                                 :start_date, 
                                 :end_date,
                                 :body)   
  end

end