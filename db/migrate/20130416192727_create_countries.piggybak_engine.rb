# This migration comes from piggybak_engine (originally 20120102162414)
require "countries"

class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :abbr
    end
  end
end
