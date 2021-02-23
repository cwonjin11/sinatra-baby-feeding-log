class BabiesController < ApplicationController
  
  get '/babies' do
    if logged_in? 
        @babies = Baby.all
        erb :'babies/index'
    else
        redirect to('/login')
    end
  end


  get '/babies/new' do
    if logged_in?
      erb :'babies/new'
    else
      redirect to('/login')
    end
  end


  post '/babies' do
    if logged_in?
      @baby = Baby.new(name: params["name"], age: params["age"], user_id: current_user.id)
      if !@baby.save
        @errors = @baby.errors.full_messages
        erb :'/babies/new'
      else
        redirect to("/babies") 
      end
    else
      redirect to('/login')
    end
  end  


  get '/babies/:id' do
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
        @baby = Baby.find(params[:id])
        @user = User.find(session[:user_id])
        erb :'babies/edit'
      else
        redirect to('/login')
      end
  end


  patch '/babies/:id' do
    @baby = Baby.find(params[:id])
    @baby.name = params[:name]
    @baby.age = params[:age]
    @schedules = Schedule.all
      if !@baby.save
        @errors = @baby.errors.full_messages
        erb :'/babies/edit'
      else
        redirect to("/babies/#{@baby.id}")
      end
  end  


  delete '/babies/:id/delete' do
    @baby = Baby.find(params[:id])
      if logged_in? && @baby.user_id == current_user.id
        @baby.destroy
        redirect to('/babies')
      else
        redirect to('/login')
      end
  end



end