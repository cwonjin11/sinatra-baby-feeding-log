class SchedulesController < ApplicationController

    get '/schedules/:id' do
        @scheme = Schedule.find(params[:id])
        if logged_in? 
            @babies = Baby.all
            @schedules = Schedule.all
            @scheme = Schedule.find(params[:id])
            @baby = Baby.find(@scheme.baby_id)
                @scheme = Schedule.new(feeding_type: params["feeding_type"], start_time: params["start_time"], 
                end_time: params["end_time"], total_amount: params["total_amount"], baby_id: params["baby_id"], user_id: params["user_id"] )
            erb :'schedules/show'            
        else
            redirect to('/login')
        end
    end


    get '/babies/:id/schedules/new' do
        @baby = Baby.find(params[:id])
        if logged_in? 
        erb :'schedules/new'
        end
    end


    post '/babies/:id/schedules' do
        if logged_in?
            @baby = Baby.find(params[:id])
            @scheme = Schedule.new(feeding_type: params["feeding_type"], start_time: params["start_time"], 
                    end_time: params["end_time"], total_amount: params["total_amount"], baby_id: @baby.id, user_id: current_user.id)
            if !@scheme.save
                @errors = @scheme.errors.full_messages
                erb :'schedules/new'
            else 
                redirect to to("/babies/#{@baby.id}")
            end
            # redirect to("/babies/#{@baby.id}") 
        else 
            redirect to('/login')
        end
    end
    

    patch '/babies/:baby_id/schedules/:id' do
        @scheme = Schedule.find(params[:id])
        @baby = Baby.find(@scheme.baby_id)
        @scheme.feeding_type = params[:feeding_type]
        @scheme.start_time = params[:start_time]
        @scheme.end_time = params[:end_time]
        @scheme.total_amount = params[:total_amount]
        if !@scheme.save
          @errors = @scheme.errors.full_messages
          erb :'/schedules/update'
        else
          redirect to("/babies/#{@baby.id}")
        end
    end  
     

    get '/babies/:baby_id/schedules/:id/update' do  
        #  binding.pry
        if logged_in? 
            @user = User.find(session[:user_id])
            @scheme = Schedule.find(params[:id])
            @baby = Baby.find(params[:baby_id])
            # @scheme.feeding_type = params[:feeding_type]
            @scheme.save
        erb :'/schedules/update'
        else
        redirect to('/login')
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