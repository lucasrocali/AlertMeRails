require 'rails_helper'

RSpec.describe User, type: :model do
  # Association test
  it  { should have_many(:locations).dependent(:destroy) }
  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it { should respond_to(:auth_token) }

  it { should validate_uniqueness_of(:auth_token)}

  describe "#generate_authentication_token!" do
	  it "generates a unique token" do
	    Devise.stub(:friendly_token).and_return("auniquetoken123")
	    @user.generate_authentication_token!
	    expect(@user.auth_token).to eql "auniquetoken123"
	  end

	  it "generates another token when one already has been taken" do
	    existing_user = FactoryGirl.create(:user, auth_token: "auniquetoken123")
	    @user.generate_authentication_token!
	    expect(@user.auth_token).not_to eql existing_user.auth_token
	  end
	end
end
