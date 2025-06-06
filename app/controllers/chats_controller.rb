class ChatsController < ApplicationController
    before_action :authenticate_user!

    def index
      @chats = Chat.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    end
  
    def show 
      @chat = Chat.find(params[:id])
      @messages = @chat.messages
      authorize! :read, @chat
    end
  
    def new
      @chat = Chat.new
      @users = User.all
    end
  
    def edit
      @chat = Chat.find(params[:id])
      @users = User.all
    end

    def create
      @chat = Chat.new(chat_params)
      if @chat.save
        redirect_to @chat, notice: 'El chat se creo exitosamente! :D'
      else
        @users = User.all
        render :new
      end
    end
  
    def update
      @chat = Chat.find(params[:id])
      @users = User.all
      if @chat.update(chat_params)
        redirect_to @chat, notice: 'Se actualizo el chat'
      else 
        render :edit
      end
    end

    private
  
    def chat_params
      params.require(:chat).permit(:sender_id, :receiver_id)
    end
  end