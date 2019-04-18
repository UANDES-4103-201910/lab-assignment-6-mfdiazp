class SessionsController < ApplicationController
	def new
	end

	def create
          user = User.find_by(session_params)
          if user != nil
            session[:current_user_id] = user.id
            flash[:notice] = "Login successful"
            redirect_to "/users/" + user.id.to_s
          else
            flash[:notice] = "Incorrect email or password"
            redirect_to root_path
          end
	end

	def destroy
          session[:current_user_id] = nil
	end

  private

    def session_params
      params.require(:session).permit(:email, :password)
    end
end
