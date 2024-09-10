class ApiController < ApplicationController
  # protected_from_forgety with: :exception
  # equivalent of authenticate_user! from Devise, but this one will check the oauth token
  before_action :doorkeeper_authorize!

  # Skip checking for CSRF token authenticate for API requests.
  skip_before_action :verify_authenticity_token

  skip_before_action :authenticate_user!

  # set response format to JSON
  # response_to :json

  # helper method to access the current_user from the token
  def current_user
    return if doorkeeper_token.nil?

    @current_user ||= User.find_by(id: doorkeeper_token.resource_owner_id)
  end
end
