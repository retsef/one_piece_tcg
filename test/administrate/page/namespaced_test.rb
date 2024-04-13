require 'test_helper'

module Logged
  class SampleModel
    extend ActiveModel::Model
    extend ActiveModel::Naming
  end

  class SampleModelDashboard < ApplicationDashboard; end
end

class Administrate::Page::NamespacedTest < ActiveSupport::TestCase
  setup do
    @dashboard = Logged::SampleModelDashboard.new
    @page = Administrate::Page::Base.new(@dashboard)
  end

  test 'returns a resource name from the dashboard' do
    assert_equal 'logged/sample_model', @page.resource_name
  end

  test 'returns a string for a resource path without namespace' do
    assert_equal 'logged_sample_model', @page.resource_path
  end
end
