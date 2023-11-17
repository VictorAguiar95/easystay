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
        @guesthouse = current_user.guesthouses.new(guesthouse_params)
      
        if @guesthouse.save
            redirect_to new_room_path, notice: 'Pousada cadastrada!'
        else
            flash.now[:notice] = 'Pousada não cadastrada'
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
end