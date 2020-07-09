class UsersController < ApplicationController

    before_action :current_user, only: [:index, :show, :create]
    # before_action :redirect_user
 
    def index
    
    end

    def show
        @user = User.find(params[:id])
        # byebug
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash[:message] = @user.errors.full_messages
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash[:message] = @user.errors.full_messages
            render :edit
        end
    end

    def destroy
        # byebug
        @user = User.find(current_user[:id])
        @user.delete
        redirect_to logout_path
    end

private

    def user_params
        params.require(:user).permit(:username, :password_digest, :user_location)
    end
end
