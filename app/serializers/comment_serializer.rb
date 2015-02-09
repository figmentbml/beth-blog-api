class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :user_id, :post_id

  has_one :user, except: [:post, :comments]
  has_one :post, except: [:user, :comments]
end
