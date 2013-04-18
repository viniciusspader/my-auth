class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products, :id => true do |t|

      t.timestamps
    end
  end
end
