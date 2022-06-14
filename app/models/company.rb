require 'pry'

class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        new_free = {item_name: item_name, dev_id: dev.id, company_id:self.id, value: value}
        binding.pry
        Freebie.create(new_free)
    end

    def self.oldest_company
        Company.where("founding_year = ?",Company.all.minimum(:founding_year))
    end
end
