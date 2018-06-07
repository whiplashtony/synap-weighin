class League < ActiveRecord::Base
    has_many :people, -> { distinct }
end
