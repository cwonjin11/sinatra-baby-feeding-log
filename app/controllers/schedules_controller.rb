class SchedulesController < ApplicationController


  get '/schedules/:id/update' do
      @user = User.find(session[:user_id])
      @scheme = Schedule.find(params[:id])
    #   @baby = Baby.find(params[:id])
      @baby = Baby.find(@scheme.baby_id)
      if logged_in? && @baby.user_id == current_user.id
      
      erb :'/schedules/new'
    else
      redirect to('/login')
    end
  end

end

# id: 26,
# feeding_type: "formula",
# start_time: 2021-02-10 21:10:00 UTC,
# end_time: 2021-02-10 21:10:00 UTC,
# total_amount: 0.2e1,
# user_id: 23,
# baby_id: 46>,