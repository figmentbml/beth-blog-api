class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :user_id

  has_one :user, except: [:post]
  has_many :comments, except: [:user, :post]
end
