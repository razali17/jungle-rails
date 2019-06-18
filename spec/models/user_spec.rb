require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'user with all validatations passed' do
      @user =User.new
      @user.email = "test1@test.com"
      @user.password = "test"
      @user.password_confirmation = "test"
      @user.first_name = "test"
      @user.last_name = "test"
      expect(@user.email).to be_present
      expect(@user.password).to be_present
    end

    it 'user with email not unique' do
      @user =User.new
      @user.email = "test@test.com"
      @user.password = "test"
      @user.password_confirmation = "test"
      @user.first_name = "test"
      @user.last_name = "test"
      @user.save

      @user2 =User.new
      @user2.email = "test@test.com"
      @user2.password = "test"
      @user2.password_confirmation = "test"
      @user.first_name = "test"
      @user.last_name = "test"

      expect(@user2).to be_invalid
    end


    it 'user with wrong pass confirm' do
      @user =User.new
      @user.email = "test1@test.com"
      @user.password = "test"
      @user.password_confirmation = "test1"
      @user.first_name = "test"
      @user.last_name = "test"
      expect(@user).to be_invalid
    end

    it 'user with not enough char for pass' do
      @user = User.new
      @user.email = "test2@test.com"
      @user.password = "tes"
      @user.password_confirmation = "tes"
      @user.first_name = "test"
      @user.last_name = "test"
      expect(@user).to be_invalid
    end

  end

  # describe '.authenticate_with_credentials' do
  #   it 'user with wrong pass confirm' do
  #     @user = User.new
  #     @user.first_name = "test"
  #     @user.last_name = "test"
  #     @user.email = "test@gmail.com"
  #     @user.password = "test1234"
  #     @user.password_confirmation = "test124"
  #     authenticate = User.authenticate_with_credentials(@user.email, @user.password)
  #     expect(authenticate).to be_valid
  #   end
  # end
end