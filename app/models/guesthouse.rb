class Guesthouse < ApplicationRecord
    
    has_many :rooms
    
    validates :trade_name, :corporate_name, :address, :neighborhood, :city, :state,
              :cep, :phone_number, :email, :cnpj, :quantity_rooms,  presence: true
              #falta validação pet
    validates :state, length: { is: 2 }
    validates :cnpj, uniqueness: true
end