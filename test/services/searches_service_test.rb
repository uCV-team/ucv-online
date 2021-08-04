require 'test_helper'

class SearchesServiceTest < ActionView::TestCase
  test 'coordinates_list with no search results' do
    full_text_search_results = []
    locations_list = []

    assert_equal locations_list, SearchesService.new(full_text_search_results).features
  end

  test 'coordinates_list with location/s available' do
    latitude = 40.7143528
    longitude = -74.0059731
    name = 'John W.'
    id = 702_892_040
    subdomain = 'johnwilliams'

    full_text_search_results = [locations(:new_york)]
    locations_list = [
      {
        type: 'Feature',
        properties:
        {
          id: id,
          subdomain: subdomain,
          name: name
        },
        geometry:
        {
          type: 'Point',
          coordinates: [
            longitude,
            latitude
          ]
        }
      }
    ]

    assert_equal locations_list, SearchesService.new(full_text_search_results).features
  end
end
