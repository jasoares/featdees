class CompleteFeaturedAttendeeSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :title, :company, :country, :interests,
    :bio, :image_url
end
