class SessionsController < ApplicationController
  
  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params['email'])
  
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params['password'])
      log_in(user)
      # redirige où tu veux, avec un flash ou pas
      redirect_to '/'
  
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'login'
    end
  end

  def new
    u = User.new(city: City.find(1), password: params['password'], email: params['email'], first_name: params['firstname'], last_name: params['name'])
    if u.save
      redirect_to sessions_login_path
    else
      render 'signin'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end

  def signin
  end

  def login
  end
end
