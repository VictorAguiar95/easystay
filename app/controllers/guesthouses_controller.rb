class GuesthousesController < ApplicationController
    def show
        set_guesthouse 
    end

    def new
        @guesthouse = Guesthouse.new
    end

    def create
        @guesthouse = Guesthouse.new(guesthouse_params)
        if @guesthouse.save
            redirect_to new_room_path, notice: 'Pousada cadastrada com sucesso.'
        else
            flash.now[:notice] = 'Dados incompleto, pousada não cadastrada'
            render 'new'
        end        
        
    end

    def edit
        set_guesthouse
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