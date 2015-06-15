class Post < ActiveRecord::Base
  attr_accessible :description, :title

  validates :title, :description , presence: true

  include PgSearch
  
  pg_search_scope :search_title, :against => [:title]

end
