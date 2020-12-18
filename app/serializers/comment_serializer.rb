class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :author_name

  def author_name
    object.user.username
  end

end
