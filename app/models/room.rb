class Room < ApplicationRecord

    belongs_to :guesthouse
    
    validates :name, :description, :size, :qty_people, :bathroom, :balcony, :wi_fi,
              :air_conditioning, :television, :wardrobe, :safe, :accessible_disabled,
              :available,  presence: true
end
