require 'rails_helper'

Rspec.describe User, type: model do
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_presence_of(:session_token)}
    it {should validate_length_of(:password).is_at_least(6)}
    describe "uniqueness" do
        before(:each) do
            create(:user)
        end
        it {should validate_uniqueness_of(:username)}
        it {should validate_uniqueness_of(:session_token)}
    end  
    
    describe "reset_session_token" do
        let!(:user) {create(:user)}
        it
    end
    end
end