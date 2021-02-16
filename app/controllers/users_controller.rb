class UsersController < ApplicationController


  get '/signup' do
    if !session[:user_id]
        erb :'users/create_user'
    else
      redirect '/babies'
    end
  end

  post '/signup' do
    @user = User.new(username: params["username"], email: params["email"], password: params["password"])
    if !@user.save
        @errors = @user.errors.full_messages
        erb :'users/create_user'
    else 
        session[:user_id] = @user.id
        redirect '/babies'
    end
  end

  get '/login' do
    if !session[:user_id]
        erb :'users/login'
    else
        redirect '/babies'
    end
  end
    
  post '/login' do
    @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect '/babies'
      else
        @errors = "Authentication Error. Please check username and/or password and try again."
        erb :'users/login'
      end
  end
    
  get '/logout' do
      if logged_in?
          session.clear
          redirect '/'
      else
          redirect '/'
      end
  end



end

