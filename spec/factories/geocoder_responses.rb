FactoryBot.define do
  factory :lookup_response, class: Hash do
    skip_create

    latitude { 40.7143528 }
    longitude { -74.0059731 }
    address { 'New York, NY, USA' }
    state { 'New York' }
    state_code { 'NY' }
    country { 'United States' }
    country_code { 'US' }

    initialize_with { attributes }
  end

  factory :update_lookup_response, class: Hash do
    skip_create

    latitude { 47.501330 }
    longitude { 8.724830 }
    address { 'Winterthur, ZH, Switzerland' }
    state { 'Zurich' }
    state_code { 'ZH' }
    country { 'Switzerland' }
    country_code { 'CH' }

    initialize_with { attributes }
  end
end
