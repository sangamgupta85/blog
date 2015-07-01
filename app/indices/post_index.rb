ThinkingSphinx::Index.define :post, :with => :active_record do
  indexes description

  indexes title, :sortable => true, :as => :post_name

  set_property :enable_star => true
  set_property :min_prefix_len => 3
  set_property :morphology => 'stem_en'
end