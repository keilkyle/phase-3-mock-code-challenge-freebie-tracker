class CreateFreebies < ActiveRecord::Migration[6.1]
  def change
      create_table :freebies do |t|
        t.integer :value
        t.string :item_name
        t.integer :dev_id
        t.integer :company_id
      end
  end
end
