class Post < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, :content, presence: true
  def feed
      Post.where("user_id = ?", id)
  end
end
