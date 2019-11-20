# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  include PostsHelper

  def set_flash_notice(type, message)
    flash[type.to_sym] = message
  end

  def initialize_new_post_editor
    @post = Post.new
  end

  def back_with_anchored_resource(anchor: '')
    "#{request.referrer}##{anchor}"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer
      .permit(:sign_up, keys: %i[firstname lastname dob sex])
  end
end
