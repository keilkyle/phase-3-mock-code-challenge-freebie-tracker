class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies
    
    def received_one?(item_name)
        self.freebies.map{|x| x.item_name}.include? "#{item_name}"
    end

    def give_away(dev, freebie)
        if self.received_one?(freebie.item_name)
            freebie.update(dev_id: dev.id)
        end
    end

end
