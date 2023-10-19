require 'rails_helper'

RSpec.describe User, type: :model do
    it "creates a user" do
        user = User.new(first_name: "John", email: "test@test.ru")
        expect(user).to be_a(User)
        expect(user.first_name).to eq("John")
        expect(user.email).to eq("test@test.ru")
        expect(user.encrypted_password).to eq("")
        expect(user.created_at).to eq(nil)
        expect(user.updated_at).to eq(nil)
      end
end