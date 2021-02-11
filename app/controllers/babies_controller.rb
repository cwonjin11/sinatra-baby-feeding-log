class BabiesController < ApplicationController
  get '/babies' do
      if logged_in?
        @current_user = User.find(session[:user_id])
        @babies = Baby.all

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
      erb :'babies/show'

    else
      redirect to('/login')
    end
  end
 

  get '/babies/:id/edit' do
      @baby = Baby.find(params[:id])
      if logged_in? && @baby.user_id == current_user.id
      #  if logged_in? && @baby.user == current_user
        @baby = Baby.find(params[:id])
        @user = User.find(session[:user_id])
        # @scheme = Schedule.find(params[:baby_id], params[:id])
        # @schedules = Schedule.all
        @scheme = Schedule.new(feeding_type: params["feeding_type"],total_amount: params["total_amount"], baby_id: @baby.id, user_id: current_user.id )
    
        erb :'babies/update_baby'
        # binding.pry
      else
        redirect to('/login')
      end
    end


  patch '/babies/:id' do
    @baby = Baby.find(params[:id])
    @baby.name = params[:name]
    @schedules = Schedule.all
    scheme = Schedule.new(feeding_type: params["feeding_type"],total_amount: params["total_amount"], 
      start_time: params["start_time"], end_time: params["end_time"], baby_id: @baby.id, user_id: current_user.id )
    scheme.save
    
    # binding.pry
   
    if !@baby.save
      @errors = @baby.errors.full_messages
      erb :'/babies/update_baby'
    else
      redirect to("/babies/#{@baby.id}")
    end
  end  
 

  
  delete '/babies/:id/delete' do
    #  binding.pry
    @baby = Baby.find(params[:id])
    if logged_in? && @baby.user_id == current_user.id
    # if logged_in? && @baby.user == current_user
      @baby.destroy
      redirect to('/babies')
    else
      redirect to('/login')
    end
  end
  

end