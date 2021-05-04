require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      @user = User.new(
        first_name: 'Summer', 
        last_name: 'Zhu',
        email: 'test@gmail.com',
        password: 'test',
        password_confirmation: 'test')
      expect(@user).to be_valid
    end

    # it 'is not valid when password and confirmation are not match' do
    #   @user = User.new(
    #     first_name: "Summer", 
    #     last_name: "Zhu",
    #     email: 'test@gmail.com',
    #     password: 'test',
    #     password_confirmation: 'wrong')
    #   expect(@user).to_not be_valid
    #   expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    # end

    # it 'is not valid when password and confirmation are not match' do
    #   @user = User.new(
    #     name: 'test',
    #     email: 'test@gmail.com',
    #     password: 'test',
    #     password_confirmation: 'wrong')
    #   expect(@user).to_not be_valid
    #   expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    # end

    # it 'is not valid when confirmation is not provided' do
    #   @user = User.new(
    #     name: 'test',
    #     email: 'test@gmail.com',
    #     password: 'test',
    #     password_confirmation: nil)
    #   expect(@user).to_not be_valid
    # end
  end
end
