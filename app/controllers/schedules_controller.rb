class SchedulesController < ApplicationController

    
    get '/schedules/:id' do
        # binding.pry
        @scheme = Schedule.find(params[:id])
        @baby = Baby.find(@scheme.baby_id)
        if logged_in? 
            @schedules = Schedule.all
            # erb :'schedules/show'
            erb :'schedules/show'            

        else
            redirect to('/login')
        end
    end

    get '/schedules/:id/new' do
        if logged_in? 
            @user = User.find(session[:user_id])
            @baby = Baby.find(params[:id])

            @scheme = Schedule.new(feeding_type: params["feeding_type"], start_time: params["start_time"], 
                end_time: params["end_time"], total_amount: params["total_amount"], baby_id: @baby.id, user_id: current_user.id )
 
        erb :'schedules/new'

        end
    end



  get '/schedules/:id/update' do
    
    # if logged_in? && @baby.user_id == current_user.id
    if logged_in? 
        @user = User.find(session[:user_id])
        @scheme = Schedule.find(params[:id])
        @baby = Baby.find(@scheme.baby_id)
      
      erb :'/schedules/update'
    else
      redirect to('/login')
    end
  end





  patch '/schedules/:id' do
    # binding.pry
    @scheme = Schedule.find(params[:id])
    @baby = Baby.find(@scheme.baby_id)
    @scheme.feeding_type = params[:feeding_type]
    @scheme.start_time = params[:start_time]
    @scheme.end_time = params[:end_time]
    @scheme.total_amount = params[:total_amount]
    # binding.pry
    if !@scheme.save
      @errors = @scheme.errors.full_messages
      erb :'/schedules/update'
    else
      redirect to("/schedules/#{@scheme.id}")
    end
  end  


  delete '/schedules/:id/delete' do
    @scheme = Schedule.find(params[:id])
    # if logged_in?
      @scheme.destroy
      @baby = Baby.find(@scheme.baby_id)
      redirect to("/babies/#{@baby.id}")
    # else
    #   redirect to('/login')
  end
  



end