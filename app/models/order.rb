class Order < ApplicationRecord
    validates :seat_number, {presence: true}
    validates :size, {presence: true}

    def menu
        return Menu.find_by(name:order.name)
    end

end
