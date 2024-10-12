class Admin::CardsController < Admin::BaseController
  def scoped_resource
    super.available_series
  end
end
