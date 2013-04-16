# This migration comes from piggybak_engine (originally 20120102154050)
class CreateTaxMethods < ActiveRecord::Migration
  def change
    create_table :tax_methods do |t|
      t.string :description, :null => false
      t.string :klass, :null => false
      t.boolean :active, :null => false, :default => false
    end
  end
end
