class SessionSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :token
end