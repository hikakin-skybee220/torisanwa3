class Order < ApplicationRecord

    def menu
        return Menu.find_by(name:order.name)
    end

end
