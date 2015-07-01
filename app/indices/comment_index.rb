ThinkingSphinx::Index.define :comment, :with => :active_record do
  indexes content

  has post(:title), :as => :post_name
  
end