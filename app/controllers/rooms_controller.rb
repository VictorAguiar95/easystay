class RoomsController < ApplicationController
    def new
        @room = Room.new
    end

    def create
        @room = Room.new(room_params)

        if @room.save
            redirect_to root_path, notice: 'Novo quarto cadastrado a pousada!'
        else
            flash.now[:notice] = 'Dados incompleto, pousada não cadastrada'
            render 'new'
        end
    end

    private

    def set_room
        @room = Room.find(params[:id])
    end

    def room_params
        puts params
        params.require(:room).permit(:name, :description, :size, :qty_people, :bathroom, :balcony,
                                                    :wi_fi, :air_conditioning, :television, :wardrobe, :safe,
                                                    :accessible_disabled, :available)
    end
end
