class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom)
    @message = Message.new
    @user_data = {}
    @chatrooms.each do |chatroom|
      user1 = User.find(chatroom.user_id)
      user2 = User.find(chatroom.user2_id)
      messages = Message.where(chatroom_id: chatroom.id)
      @user_data[chatroom.id] = {
        user1: user1,
        user2: user2,
        messages: messages
      }
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])

    if current_user.id == @chatroom.user_id
      @user = User.where(id: @chatroom.user2_id).first
    else
      @user = User.where(id: @chatroom.user_id).first
    end

    @message = Message.new
    authorize @chatroom
  end

  def new
    session[:user2_id] = params[:user2_id]

    @chatroom = Chatroom.new
    authorize @chatroom
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.user_id = current_user.id
    @chatroom.user2_id = session[:user2_id].to_i

    authorize @chatroom
    respond_to do |format|
      if @chatroom.save
        format.html { redirect_to chatroom_url(@chatroom), notice: "You are now connected." }
        format.json { render :show, status: :created, location: @chatroom }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chatroom.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name, :user2_id, :user_id)
  end
end
