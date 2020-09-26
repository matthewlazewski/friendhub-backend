class Api::V1::SessionsController < ApplicationController
    
  def create
        @user = User.find_by(email: session_params[:email])
      
        if @user && @user.authenticate(session_params[:password])
          login!
          options = {
            include: [:posts,:comments]
          }
          render json: {
            logged_in: true,
            user: UserSerializer.new(@user, options)
          }
        else
          render json: { 
            status: 401,
            errors: ['no such user', 'verify credentials and try again or signup']
          }
        end
    end

    def is_logged_in?
        if current_user
          render json: {
            logged_in: true,
            user: current_user
          }
        else
          render json: {
            logged_in: false,
            message: 'no such user'
          }
        end
    end

    def destroy
        logout!
        render json: {
            status: 200,
            logged_out: true
        }
    end
    
    private
    def session_params
        params.require(:user).permit(:name, :email, :password)
    end
end