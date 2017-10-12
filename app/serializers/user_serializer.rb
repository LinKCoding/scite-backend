class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email

# add in stuff later for notes and lexicons
end
