class Product < ActiveRecord::Base

  acts_as_sellable

  attr_accessible :name

  validates_presence_of :name

end
