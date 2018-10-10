require 'rails_helper'

RSpec.describe PersonalcvsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/personalcvs').to route_to('personalcvs#index')
    end

    it 'routes to #new' do
      expect(get: '/personalcvs/new').to route_to('personalcvs#new')
    end

    it 'routes to #show' do
      expect(get: '/personalcvs/1').to route_to('personalcvs#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/personalcvs/1/edit').to route_to('personalcvs#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/personalcvs').to route_to('personalcvs#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/personalcvs/1').to route_to('personalcvs#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/personalcvs/1').to route_to('personalcvs#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/personalcvs/1').to route_to('personalcvs#destroy', id: '1')
    end
  end
end
