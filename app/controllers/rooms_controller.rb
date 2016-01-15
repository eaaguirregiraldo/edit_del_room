class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
      if @room.update(room_params)
        redirect_to rooms_path, notice: "La Habitación se actualizó con exito!!!"
      else
        render :edit
      end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    
    redirect_to rooms_path, notice: "La habitacion fue eliminado con éxito"
  end

  protected
    def room_params
      params.require(:room).permit(:title, :description, :beds, :guests, :image_url)
    end
end
