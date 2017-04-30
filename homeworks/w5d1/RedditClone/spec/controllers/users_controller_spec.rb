require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
      it "renders the new template" do
        get :new, {}
        expect(response).to render_template("new")
      end
    end

    describe "POST #create" do
      context "with invalid params" do
        it "validates the presence of the user's username and password" do
          post :create, user: {name: "something", password: "pass"}
          expect(response).to render_template("new")
          expect(flash[:errors]).to be_present
          save_and_open_page
        end

        it "validates that the password is at least 6 characters long" do
          post :create, user: {name: "something", password: "pass"}
          expect(response).to render_template("new")
          expect(flash[:errors]).to be_present
        end
      end

      context "with valid params" do
        it "redirects user to subreddits on success" do
          post :create, user: {name: "something", password: "password"}
          expect(response).to have_content "SubReddits"
        end
      end
    end
end
