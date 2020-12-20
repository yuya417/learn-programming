# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_article_id  (article_id)
#  index_comments_on_user_id     (user_id)
#
class CommentSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :content, :created_at, :author_name, :author_image

  def author_name
    object.user.username
  end

  def author_image
    if object.user.author_image != 'top-page.jpg'
      rails_blob_path(object.user.author_image) 
    else
      "/assets/top-page-5e2db3dee6619558ca8142ba969b1fdad2b3db6345c7c69b2a9e5b55770d941a.jpg"
    end
  end

end
