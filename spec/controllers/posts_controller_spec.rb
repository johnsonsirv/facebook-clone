require 'rails_helper'

RSpec.describe PostsController, type: :controller do
	it { should use_before_action(:get_timeline_posts) }
	it { should use_before_action(:initialize_new_post_editor) }
	it { should use_before_action(:find_post) }
end
