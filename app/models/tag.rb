class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, through: :post_tags



  def self.search_for_autocomplete(text)
    where("name LIKE ?", "%#{text}%").limit(10)
  end

  def to_autocomplete_hash
      {
        id:   id,
        name: name,
      }
  end
end


