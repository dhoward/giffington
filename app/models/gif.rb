class Gif < ActiveRecord::Base
  attr_accessible :source, :url
  validates_uniqueness_of :url
end
