class SessionController < ApplicationController
  before_action :authorize, except: [:index, :new, :destroy, :new_account, :create_account, :validate_account]

  def index
  end

  # login
  def new
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:email_user] = user.email
      flash[:notice] = "Sesión iniciada correctamente"
      redirect_to root_path
    else
      flash[:error] = "Email o contraseña incorrectos"
      redirect_to session_index_path
    end
  end

  # logout
  def destroy
    session[:email_user] = nil
    flash[:notice] = "Sesión cerrada correctamente"
    redirect_to session_index_path
  end

  def rescue_password
  end

  def do_rescue_password
  end

  def new_account
  end

  def create_account
    user = User.new(user_params)
    if user.save
      session[:email_user] = user.email
      redirect_to root_path
    else
      redirect_to session_new_account_path
    end
  end

  def validate_account
  end

  private
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
end
