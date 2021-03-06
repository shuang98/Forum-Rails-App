class UsersController < ApplicationController
	before_filter :authorize, except: [:new, :create]
	def index
		@users = User.all
	end
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to posts_path
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])

	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user)
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to logout_path
	end


	private
		def user_params
			params.require(:user).permit(:username, :email, :password, :password_confirmation)
		end
end
