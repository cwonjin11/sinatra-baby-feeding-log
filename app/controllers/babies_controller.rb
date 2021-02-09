class BabiesController < ApplicationController
  get '/babies' do
    # binding.pry
      if logged_in?
        @babies = Baby.all
        # binding.pry
          # @babies = Baby.all
            # @babies = Baby.all
        @current_user = User.find(session[:user_id])
        erb :'babies/index'
      else
        redirect '/login'
      end
  end

  get '/babies/new' do
      if logged_in?
          # @current_user
        erb :'babies/new'
      else
        redirect to '/login'
      end
  end


  post '/babies' do
      # binding.pry
      if logged_in?
        
        @baby = Baby.new(name: params["name"], age: params["age"], user_id: current_user.id)
      #  binding.pry
        # @baby = current_user.babies.build(name: params["name"], age: params["age"])
        # @baby = current_user.babies.build(params)
    
          # puts params
        if !@baby.save
              
          @errors = @baby.errors.full_messages
          erb :'/babies/new'
          
        else
          redirect to "/babies" 
        end
      else
        redirect to('/login')
      end
  end  

  get '/babies/:id' do
    # binding.pry
    @baby = Baby.find(params[:id])
    if logged_in? && @baby.user_id == current_user.id
      @schedules = Schedule.all
      erb :'schedules/index'

    else
      redirect to('/login')
    end
  end


 

  get '/babies/:id/edit' do
      @baby = Baby.find(params[:id])
      if logged_in? && @baby.user == current_user
        @baby = Baby.find(params[:id])
        @user = User.find(session[:user_id])
        erb :'babies/update_baby'
      else
        redirect to('/login')
      end
    end


end