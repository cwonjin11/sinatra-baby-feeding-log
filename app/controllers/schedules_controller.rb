class SchedulesController < ApplicationController


    get '/babies/:id/schedules/new' do
        @baby = Baby.find(params[:id])
        if logged_in? && @baby.user_id == current_user.id
            erb :'schedules/new'
        else
            redirect to("/babies/#{@baby.id}")
        end
    end


    post '/babies/:id/schedules' do
        @baby = Baby.find(params[:id])
        if logged_in? && @baby.user_id == current_user.id
            
            @scheme = Schedule.new(feeding_type: params["feeding_type"], start_time: params["start_time"], 
                    end_time: params["end_time"], total_amount: params["total_amount"], baby_id: @baby.id, user_id: current_user.id)
            if !@scheme.save
                @errors = @scheme.errors.full_messages
                erb :'schedules/new'
            else 
                redirect to to("/babies/#{@baby.id}")
            end
             
        else 
            redirect to("/babies/#{@baby.id}")
        end
    end
  
    get '/babies/:baby_id/schedules/:id/update' do  
       
        @baby = Baby.find(params[:baby_id])
        @scheme = Schedule.find(params[:id])
        # binding.pry
        if logged_in? && @baby.user_id == current_user.id && current_user.id == @scheme.user_id
            @user = User.find(session[:user_id])
            @scheme = Schedule.find(params[:id])
            @baby = Baby.find(params[:baby_id])
            # @scheme.feeding_type = params[:feeding_type]
            @scheme.save
            erb :'/schedules/update'
        else
            redirect to("/babies/#{@baby.id}")
        end
    end

    patch '/babies/:baby_id/schedules/:id' do
        @scheme = Schedule.find(params[:id])
        @baby = Baby.find(@scheme.baby_id)
        if logged_in? && @baby.user_id == current_user.id && current_user.id == @scheme.user_id
        @scheme.feeding_type = params[:feeding_type]
        @scheme.start_time = params[:start_time]
        @scheme.end_time = params[:end_time]
        @scheme.total_amount = params[:total_amount]
        end
        if !@scheme.save
          @errors = @scheme.errors.full_messages
          erb :'/schedules/update'
        else
          redirect to("/babies/#{@baby.id}")
        end
    end  
     

    delete '/babies/:baby_id/schedules/:id/delete' do
        @scheme = Schedule.find(params[:id])
        if logged_in? 
            @scheme.destroy
            @baby = Baby.find(@scheme.baby_id)
            redirect to("/babies/#{@baby.id}")
        else
            redirect to('/login')
        end
    end


end