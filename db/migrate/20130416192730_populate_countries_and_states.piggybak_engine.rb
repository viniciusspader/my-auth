# This migration comes from piggybak_engine (originally 20120104020930)
require "countries"

class PopulateCountriesAndStates < ActiveRecord::Migration
  def change
    ISO3166::Country.all.each do |country_array|
      name = country_array[0]
      abbr = country_array[1]
      country = Piggybak::Country.create :name => name, :abbr => abbr

      iso3166_country = ISO3166::Country.new(abbr)
      iso3166_country.states.each do |key, value|
        abbr = key
        name = value["name"]
        Piggybak::State.create! :name => name, :abbr => abbr, :country => country
      end
    end
  end
end
