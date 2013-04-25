class Post < ActiveRecord::Base
  attr_accessible :content, :title

  belongs_to :users

  validates_presence_of :content
  validates_presence_of :title
  validates_uniqueness_of :title
end
