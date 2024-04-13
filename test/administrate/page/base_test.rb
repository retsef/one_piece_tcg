require 'test_helper'

class SampleModel
  extend ActiveModel::Model
  extend ActiveModel::Naming
end

class SampleModelDashboard < ApplicationDashboard; end

class Administrate::Page::BaseTest < ActiveSupport::TestCase
  setup do
    @dashboard = SampleModelDashboard.new
    @page = Administrate::Page::Base.new(@dashboard)
  end

  test 'returns a resource name from the dashboard' do
    assert_equal 'sample_model', @page.resource_name
  end

  test 'returns a string for a resource path without namespace' do
    assert_equal 'sample_model', @page.resource_path
  end
end
