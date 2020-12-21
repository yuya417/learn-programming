# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  title      :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many_attached :images

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

  def author_name
    user.username
  end

  def like_count
    likes.count
  end

  def comment_count
    comments.count
  end

end
