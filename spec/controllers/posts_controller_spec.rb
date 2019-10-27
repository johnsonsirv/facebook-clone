require 'rails_helper'

RSpec.describe PostsController, type: :controller do
	context 'redirect unauthenticated users to signup' do
		it { should route(:get, '/posts').
			to(action: :new) }
	end
end
