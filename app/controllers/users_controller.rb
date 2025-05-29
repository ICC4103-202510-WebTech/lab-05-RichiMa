class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
    before_action :authenticate_user!
    def index
        @users = User.all
    end
  
    def show 
    end
  
    def new
        @user = User.new
    end

    def edit
        
    end


    def create 
        @user = User.new(user_params)
            if @user.save 
                redirect_to @user, notice: 'Se creo el usuario! :D'
            else
                render :new
        end
    end
  
    def update
        if @user.update(user_params)
            redirect_to @user, notice: 'Se actualizo el usuario'
        else
            render :edit
        end
    end

    private
  
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email)
    end

    def set_user
        @user = User.find(params[:id])
    end
  end
  