class Post < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validate :picture_size
  validates :user_id, presence: true
  validates :title, :content, presence: true
  def feed
      Post.where("user_id = ?", id)
  end

  private

  def picture_size
    if picture.size > 4.megabyte
      errors.add(:picture, "should be less than 4MB.")
    end
  end
end
