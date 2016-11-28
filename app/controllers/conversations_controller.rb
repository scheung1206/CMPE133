class ConversationsController < ApplicationController
	def index
		@conversations = current_user.mailbox.conversations.order('created_at DESC')
	end

	def show
		@conversation = current_user.mailbox.conversations.find(params[:id])
	end

	def new
		@recipients = [User.find(params[:user])]
	end

	def create
		recipient = User.find(params[:user_id])
		receipt = current_user.send_message(recipient, params[:body], params[:subject])
		redirect_to conversation_path(receipt.conversation)
	end
end
