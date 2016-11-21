require 'test_helper'

class Api::V1::FeaturedAttendeesControllerTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' }

  test 'should get a valid list of featured attendees' do
    get api_v1_featured_attendees_url
    assert_response :success
    assert_equal response.content_type, 'application/vnd.websummit.v1+json'
    data = JSON.parse(response.body)['data']
    assert_equal 6, data.size
    assert_equal 'featured-attendees', data[0]['type']
    assert_nil data[0]['attributes']['bio']
    assert_nil data[0]['attributes']['image-url']
    assert_not_nil data[0]['attributes']['thumbnail-url']
  end

  test 'should get a valid featured attendee' do
    fa = featured_attendees(:musk)
    get api_v1_featured_attendee_url(id: fa.id)
    assert_response :success
    data = JSON.parse(response.body)['data']
    assert_equal fa.id.to_s, data['id']
    assert_equal fa.first_name, data['attributes']['first-name']
    assert_equal fa.last_name, data['attributes']['last-name']
    assert_equal fa.bio, data['attributes']['bio']
    assert_equal fa.image_url, data['attributes']['image-url']
  end
end
