# frozen_string_literal: true

module Api
  module V1
    module Users
      class RegistrationsController < ApiController
        skip_before_action :doorkeeper_authorize!, user: :create

        include DoorkeeperRegisterable

        def create
          client_app = Doorkeeper::Application.find_by(uid: user_params[:client_id])
          return render json: {
            error: I18n.t('doorkeeper.errors.messages.invalid_client')
          }, status: :unauthorized unless client_app

          user = User.new(user_params.except(:client_id))
          return render json: { errors: user.errors }, status: :unprocessable_entity unless user.save

          render json: render_user(user, client_app), status: :created
        end

        private

        def user_params
          params.require(:user).permit(:email, :password, :client_id)
        end
      end
    end
  end
end
