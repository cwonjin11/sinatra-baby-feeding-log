class BabiesController < ApplicationController
  get '/babies' do
    if logged_in? 
        # @current_user = User.find(session[:user_id])
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
      if logged_in?
        @baby = Baby.new(name: params["name"], age: params["age"], user_id: current_user.id)
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
      # binding.pry
      # @scheme = Schedule.find(params[:id])
      # @scheme.feeding_type = params[:feeding_type]
      # @scheme.start_time = params[:start_time]
      # @scheme.end_time = params[:end_time]
      # @scheme.total_amount = params[:total_amount]
      # @scheme = Schedule.new(feeding_type: params["feeding_type"],total_amount: params["total_amount"], baby_id: @baby.id, user_id: current_user.id )
      # @scheme = Schedule.find(params[:id])
      # binding.pry
      # @scheme = Schedule.new(feeding_type: params["feeding_type"], start_time: params["start_time"], 
      #   end_time: params["end_time"], total_amount: params["total_amount"], baby_id: @baby.id, user_id: current_user.id )
      # @scheme = Schedule.find(params[:id])
      erb :'babies/show'
     
    else
      redirect to('/login')
    end
    
  end


  # get '/babies/:name/edit' do
  #   if logged_in?
  #   @baby = Baby.find(params[:name])
    
  #     erb :'/babies/edit_baby'
  #   end
  #   # redirect to("/babies/#{@baby.id}")

  # end
 

  get '/babies/:id/edit' do
    # binding.pry  
    @baby = Baby.find(params[:id])
      if logged_in? && @baby.user_id == current_user.id
      #  if logged_in? && @baby.user == current_user
        @baby = Baby.find(params[:id])
        @user = User.find(session[:user_id])
        # @scheme = Schedule.find(params[:baby_id], params[:id])
        # @schedules = Schedule.all
    
        erb :'babies/edit'
      else
        redirect to('/login')
      end
    end


  patch '/babies/:id' do
    # binding.pry
    @baby = Baby.find(params[:id])
    @baby.name = params[:name]
    @baby.age = params[:age]
    @schedules = Schedule.all
    # @scheme = Schedule.find(params[:id])
    
    # @scheme = Schedule.new(feeding_type: params["feeding_type"],total_amount: params["total_amount"], 
    #   start_time: params["start_time"], end_time: params["end_time"], baby_id: @baby.id, user_id: current_user.id )
    # @scheme.feeding_type = params[:feeding_type]
    # @scheme.start_time = params[:start_time]
    # @scheme.end_time = params[:end_time]
    # @scheme.total_amount = params[:total_amount]
    # # binding.pry
    # @scheme.save
    
    # binding.pry 
   
    if !@baby.save
      @errors = @baby.errors.full_messages
      erb :'/babies/edit'
    else
      redirect to("/babies/#{@baby.id}")
    end
  end  

 
  # get '/babies/:name/edit' do
  #   if logged_in?
  #   @baby = Baby.find(params[:name])
    
  #     erb :'/babies/edit_baby'
  #   end

  # end
 
  # post '/babies/:name' do
  #   if logged_in?
  #   @baby = Baby.find(params[:name])
  #   @baby.name = params[:name]
  #   @baby.age = params[:age]
  #   @baby.save
  #   @schedules = Schedule.all
  #     erb :'/babies/show'
      
  #   end

  #   # binding.pry
  # end
 
 

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