class MessagesController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    def index
        @messages = Message.where(user_id: current_user.id) 
    end
  
    def show 
        @message = Message.find(params[:id])
    end
  
    def new 
        @message = Message.new
        @chats = Chat.all
        @users = User.all
    end

    def edit
        @message = Message.find(params[:id])
    end
  
    def create 
        @message = Message.new(message_params)
            if @message.save
                redirect_to @message, notice: 'Se creo exitosamente el mensaje! :D'
            else
                @chats = Chat.all
                @users = User.all
                render :new
        end
    end
  
    def update
        @message = Message.find(params[:id])
        if @message.update(message_params)
            redirect_to @message, notice: 'Se actualizo el mensaje'
        else
            render :edit
        end
    end

    private
  
    def message_params
        params.require(:message).permit(:body, :chat_id, :user_id)
    end
  end
