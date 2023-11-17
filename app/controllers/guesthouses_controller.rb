class GuesthousesController < ApplicationController
    before_action :authenticate_user!, only: [:new]
    before_action :check_proprietario, only: [:new, :create, :edit, :update]    
    def show
        set_guesthouse 
    end

    def new
        if current_user.guesthouses.any?
            return redirect_to root_path, alert: 'Você já possui uma pousada cadastrada'
          else
            @guesthouse = Guesthouse.new
        end
    end

    def create
        @room = Room.new(room_params)
        if @room.save
            redirect_to root_path, notice: 'Novo quarto cadastrado a pousada!'
        else
            Rails.logger.info(@room.errors.full_messages)
            flash.now[:notice] = 'Dados incompletos, quarto não cadastrado'
            render 'new'
        end
    end

    def edit
        set_guesthouse
        redirect_to root_path, alert: 'Acesso negado!' unless current_user == @guesthouse.user
    end

    def update
        set_guesthouse

        if @guesthouse.update(guesthouse_params)
            redirect_to guesthouse_path(@guesthouse.id), notice: 'Pousada atualizada com sucesso.'
        else
            flash.now[:notice] = 'Não foi possível atualizar a pousada.'
            render 'edit'
        end
    end

    private

    def set_guesthouse
        @guesthouse = Guesthouse.find(params[:id])
    end

    def guesthouse_params
        params.require(:guesthouse).permit(:trade_name, :corporate_name, :address, :neighborhood,
                                                               :city, :state, :cep, :phone_number, :email, :cnpj, 
                                                               :quantity_rooms)
                                                               #ainda não fiz o cadastro de pets
    end

    def room_params
        puts params
        params.require(:room).permit(:name, :description, :size, :qty_people, :bathroom, :balcony,
                                                    :wi_fi, :air_conditioning, :television, :wardrobe, :safe,
                                                    :accessible_disabled, :available)
    end
end