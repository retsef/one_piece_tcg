require 'test_helper'

class Administrate::NamespaceTest < ActiveSupport::TestCase
  teardown do
    Rails.application.reload_routes!
  end

  test 'searches the routes for resources in the namespace' do
    namespace = Administrate::Namespace.new(:admin)

    Rails.application.routes.draw do
      namespace(:admin) { resources :customers }
      resources :administrators
    end

    assert_equal [ :customers ], namespace.resources.map(&:to_sym)
  end

  test 'returns only resources with the index route' do
    namespace = Administrate::Namespace.new(:admin)

    Rails.application.routes.draw do
      namespace(:admin) do
        resources :customers
        resources :products, only: [ :show ]
      end
    end

    assert_equal [ 'customers' ], namespace.resources_with_index_route
  end

  test 'returns a list of unique resources' do
    namespace = Administrate::Namespace.new(:admin)

    Rails.application.routes.draw do
      namespace(:admin) do
        resources :customers
        resources :products, only: [ :show ]

        root to: 'customers#index'
      end
    end

    assert_equal [ 'customers' ], namespace.resources_with_index_route
  end
end
