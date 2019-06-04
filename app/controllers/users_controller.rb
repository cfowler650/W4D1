class UsersController < ApplicationController
  def index
    user = User.all
    render json: user  
  end

  def create
    user = User.new(params.require(:user).permit(:username))
    if user.save
      render json: user
    else  
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

    def find_user_by_id
      User.find(params[:id])
    end

    def show
      render json: User.find(params[:id])
    end

    def update
     @user = find_user_by_id
     
     @user.update!(user_params)
     render json: @user
    
    end


    def user_params
      params.require(:user).permit(:username)
    end

    def destroy
        @user = find_user_by_id

        @user.destroy!
        render json: @user
    end
end
