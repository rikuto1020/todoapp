class MessagesController < ApplicationController
  before_action :set_group

  def index
  end

  def new
    @message = Message.new
    @messages = @category.messages.includes(:user)
  end

  def create
    @message = @category.messages.new(message_params)
    if @message.save
      redirect_to category_messages_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :memo).merge(user_id: current_user.id)
  end

  def set_group
    @category = Category.find(params[:category_id])
  end
end
