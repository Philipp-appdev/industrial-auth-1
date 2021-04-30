class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed followers following discover ]
  before_action :restrict_views_to_current_user, only: [ :discover, :feed ]

  def discover
  end

  def feed
  end

  private

    def set_user
      if params[:username]
        @user = User.find_by!(username: params.fetch(:username))
      else
        @user = current_user
      end
    end

    def restrict_views_to_current_user
      if params[:username].present? && current_user.username != params[:username]
        redirect_back fallback_location: root_url, alert: "You're not authorized for that!"
      end
    end

end