# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it { should use_before_action(:get_created_posts) }
end
