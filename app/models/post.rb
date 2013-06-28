class Post < ActiveRecord::Base
  has_many :post_tags
  has_many :tags, through: :post_tags
  default_scope order('created_at DESC')


  def tag_tokens=(tag_ids)
  	self.tags.delete_all
    self.tags << tag_ids.split(",").map { |id| Tag.find(id.to_i) }
  end
end
