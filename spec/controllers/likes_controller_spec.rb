require 'rails_helper'

RSpec.describe LikesController, type: :controller do
	it { should use_before_action(:get_resource_to_be_liked) }
end
