class Flavor < ApplicationRecord

    has_many :beers_flavors
    has_many :beers, through: :beers_flavors

    def randomise_beers
        
    end

end
