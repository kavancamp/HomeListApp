class MessagesController < ApplicationController
    before_action :set_sidebar
    before_action do
        @conversation = Conversation.find(params[:conversation_id])
      end

    
      def index
        @messages = @conversation.messages
        @message = @conversation.messages.new
      end
      
      def create
        @message = @conversation.messages.new(message_params)
        @message.account_id = current_account.id
        if @message.save
          redirect_to conversation_messages_path(@conversation)
        end
      end

      def new
        @message = @conversation.messages.new
      end
    
  
      private
      def message_params
        params.require(:message).permit(:body, :account_id)
      end
      
end
