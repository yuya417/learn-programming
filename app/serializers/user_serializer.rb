# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :author_image

  def author_image
    if object.author_image != 'top-page.jpg'
      rails_blob_path(object.author_image) 
    else
      "/assets/top-page-5e2db3dee6619558ca8142ba969b1fdad2b3db6345c7c69b2a9e5b55770d941a.jpg"
    end
  end

end
