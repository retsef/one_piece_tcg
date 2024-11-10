module Auth
  class BaseController < ApplicationController
    layout 'auth'

    default_form_builder Auth::FormBuilder
  end
end
