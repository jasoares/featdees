class FeaturedAttendeeSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :title, :company, :country, :interests,
    :thumbnail_url
end
