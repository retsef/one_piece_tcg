# frozen_string_literal: true

require 'net/http'

class UserFeedbacksController < ApplicationController
  default_form_builder Admin::FormBuilder

  def new
    # unless turbo_frame_request?
    #   redirect_to root_path, status: :see_other
    #   return
    # end

    # super
  end

  ## curl https://sentry.io/api/0/projects/{organization_slug}/{project_slug}/user-feedback/ \
  #  -H 'Authorization: Bearer <auth_token>' \
  #  -H 'Content-Type: application/json' \
  #  -d '{"event_id":"14bad9a2e3774046977a21440ddb39b2","name":"Jane Schmidt","email":"jane@empowerplant.io","comments":"It broke!"}'
  def create
    organization_slug = Rails.application.config.sentry.organization_slug
    project_slug = Rails.application.config.sentry.project_slug
    event = Sentry.capture_exception(StandardError.new('User Feedback Submitted'))

    headers = {
      Authorization: "Bearer #{Rails.application.credentials.dig(:sentry, :auth_token)}",
      'Content-Type': 'application/json'
    }
    data = {
      event_id: event&.event_id,
      name: user_feedback_params[:name],
      email: user_feedback_params[:email],
      comments: user_feedback_params[:message]
    }.to_json

    upstream_sentry_url = "https://sentry.io/api/0/projects/#{organization_slug}/#{project_slug}/user-feedback/"
    response = Net::HTTP.post(URI(upstream_sentry_url), data, headers)

    if %w[200 201].include? response.code
      flash[:success] = t('.success')
    else
      flash[:error] = t('.failure')
    end

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

    def user_feedback_params
      params.require(:user_feedbacks)
            .with_defaults(email: current_user&.email, name: current_user&.name)
            .permit(:email, :name, :message)
    end
end
