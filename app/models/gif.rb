class Gif < ActiveRecord::Base
  attr_accessible :source, :url, :moderated
  validates_uniqueness_of :url
  
  default_scope order('id ASC')
  scope :next, lambda { |g| {:conditions => ["id > ?", g.id], :limit => 1, :order => "id"} }
end
