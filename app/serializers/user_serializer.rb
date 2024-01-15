class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name, :thumbnail
end
