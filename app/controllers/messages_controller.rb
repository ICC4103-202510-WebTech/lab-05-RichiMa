class MessagesController < ApplicationController
    
    def index
        @messages = Message.all
    end
  
    def show 
        @message = Message.find(params[:id])
    end
  
    def new 
        @message = Message.new
        @chats = Chat.all
        @users = User.all
    end
  
    def create 
        @message = Message.new(message_params)
            if @message.save
                redirect_to @message
            else
                @chats = Chat.all
                @users = User.all
                render :new
        end
    end
  
    private
  
    def message_params
        params.require(:message).permit(:body, :chat_id, :user_id)
    end
  end
  