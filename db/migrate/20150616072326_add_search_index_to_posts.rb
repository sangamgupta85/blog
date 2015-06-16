class AddSearchIndexToPosts < ActiveRecord::Migration
  def up
  	execute "create index posts_title on posts using gin(to_tsvector('english', title))"
  	execute "create index posts_description on posts using gin(to_tsvector('english', description))"
  end

  def down
  	execute "drop index posts_title"
  	execute "drop index posts_description"  	
  end
end
