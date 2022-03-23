class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one? item_name
        found = self.freebies.where("item_name == ?", item_name) 
        found[0] ? true : false

        # found = self.freebies.find_by(item_name: item_name)
        # found ? true : false

    end

    def give_away dev, freebie
        freebie.update(dev: dev) unless self != freebie.dev
    end

    # def give_away(dev, freebie)
    #     if self.received_one?(freebie.item_name)
    #         freebie.update(dev: dev)
    #     else
    #         "#{self.name} does not have a #{freebie.item_name} to give away to #{dev.name}"
    #     end
    # end



end
