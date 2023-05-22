class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end

  def new
    @chatroom = Chatroom.new
    authorize @chatroom
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.user_id = current_user.id
    @chatroom.user2_id = params[:user2_id]
    authorize @chatroom
    respond_to do |format|
      if @chatroom.save
        format.html { redirect_to chatroom_url(@chatroom), notice: "chatroom was successfully created." }
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
