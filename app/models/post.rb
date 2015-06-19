class Post < ActiveRecord::Base
  attr_accessible :description, :title

  validates :title, :description , presence: true

  has_many :comments, dependent: :destroy

  include PgSearch
  
  pg_search_scope :search, :against => [:title, :description],
  	using: {tsearch: {dictionary: "english"}},
  	ignoring: :accents

  def self.text_search(query)
  	if query.present?
      #search using pg search
  		# search(query) 

      #search using custom method
  		rank = <<-RANK
  			ts_rank(to_tsvector(comments.content), plainto_tsquery(#{sanitize(query)}))
  		RANK
  		where("to_tsvector('english', title) @@ plainto_tsquery(:query)
       or to_tsvector('english', description) @@ plainto_tsquery(:query)
       or to_tsvector('english', comments.content) @@ plainto_tsquery(:query)", query: query)
        .order("#{rank} desc")
    else
    	scoped
    end
  end

end
