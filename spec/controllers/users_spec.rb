require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe 'GET #new' do
        it "renders the new view" do
            get :new
            expect(response).to render_template(:new)
            #expect(response).to have_http_status(200)
        end
    end

    describe 'GET #index' do
        it "render the index view" do
            get :index
            expect(response).to render_template(:index)
        end
    end

    describe 'GET #show' do
        it "renders the show view" do
            create(:user)
            get :show, params: {id: user.id}
            expect(response).to render_template(:show)
        end
    end

    describe "POST #create" do
        context "valid params" do
            it "creates a new user" do
                post :create, user_params: {username: "BigRuss", password: "password1"}
                expect(response).to have_http_status(302) 
                expect(response).to redirect_to(goals_url)
            end
        end
        
        context "invalid params" do
            it "renders new template" do 
                create(:user)
                post :create, params: {username: user.username, password: user.password}
                expect(response).to render_template(:new)
            end
        end
    end


end