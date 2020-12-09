require 'rails_helper'

RSpec.describe User, type: :model do
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
    
    describe "#reset_session_token!" do
        let!(:user) {create(:user)}

        it "should change a user's sesion token" do
            token = user.session_token
            expect(user.reset_session_token!).to_not eq(token)
        end
    end

    describe "::find_by_credentials" do
        let!(:user) {create(:user)}

        context "user exists" do
            it "should find the user by username and password" do
                expect(User.find_by_credentials(user.username, user.password)).to eq(user)
            end
        end

        context "could not find user" do
            it "should find the user by username and password" do
                expect(User.find_by_credentials("usersdf", "sword235")).to eq(nil)
            end
        end
    end

    describe "::generate_session_token" do
        it "should return a string of length 14" do
            expect(User.generate_session_token.class).to be(String)
            expect(User.generate_session_token.length).to eq(14)
        end
    end

    describe "#is_password?" do
        let!(:user) {create(:user)}
        context "correct password" do
            it "is the correct password" do
                expect(user.is_password?(user.password)).to be true
            end    
        end
        context "incorrect password" do
            it "is the incorrect password" do
                expect(user.is_password?("sadassword")).to be false
            end
        end
    end    
end