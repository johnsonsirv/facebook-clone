# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  it { should use_before_action(:find_resource_to_be_liked) }
end
