require 'rails_helper'

RSpec.describe User, type: :model do
  context "Associations" do
		it { should have_many(:posts)}
	end
	
	context 'Validations' do
		
	end
end
