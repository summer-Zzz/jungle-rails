require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      @user = User.new(
        first_name: 'Summer', 
        last_name: 'Zhu',
        email: 'summer@gmail.com',
        password: 'testtesttest',
        password_confirmation: 'testtesttest')
      expect(@user).to be_valid
    end

    it 'is not valid when first name is not provided' do
      @user = User.new(
        first_name: nil, 
        last_name: "Zhu",
        email: 'test@gmail.com',
        password: 'testtesttest',
        password_confirmation: 'testtesttest')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it 'is not valid when last name is not provided' do
      @user = User.new(
        first_name: 'Summer', 
        last_name: nil,
        email: 'test@gmail.com',
        password: 'testtesttest',
        password_confirmation: 'testtesttest')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end


    it 'is not valid when email is not provided' do
      @user = User.new(
        first_name: "Summer", 
        last_name: "Zhu",
        email: nil,
        password: 'testtesttest',
        password_confirmation: 'testtesttest')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'is not valid when password is not provided' do
      @user = User.new(
        first_name: "Summer", 
        last_name: "Zhu",
        email: 'test@gmail.com',
        password: nil,
        password_confirmation: 'testtesttest')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'is not valid when confirmation is not provided' do
      @user = User.new(
        first_name: "Summer", 
        last_name: "Zhu",
        email: 'test@gmail.com',
        password: 'testtesttest',
        password_confirmation: nil)
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password confirmation can't be blank"
    end

    it 'is not valid when password and confirmation are not match' do
      @user = User.new(
        first_name: "Summer", 
        last_name: "Zhu",
        email: 'test@gmail.com',
        password: 'testtesttest',
        password_confirmation: 'wrongtesttesttest')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it "is not valid when email is not case sensitive" do
      @user1 = User.new(
        first_name: "Summer",
        last_name: "Zhu",
        email: "test@gmail.com",
        password: "testtesttest",
        password_confirmation: "testtesttest"
      )
      @user1.save
      @user2 = User.new(
        first_name: "Summer",
        last_name: "Zhu",
        email: "TEST@gmail.com",
        password: "testtesttest",
        password_confirmation: "testtesttest"
      )
      @user2.save
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages_for(:email)).to include("Email has already been taken")
    end
  
    it 'is not valid when password is shorter than 8 characters' do
      @user = User.new(
        first_name: "Summer", 
        last_name: "Zhu",
        email: 'test@gmail.com',
        password: 'test',
        password_confirmation: 'test')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 8 characters)"
    end
  end

  describe '.authenticate_with_credentials' do
    it 'returns nil when password is not match the email' do
      @user = User.new(
        first_name: 'Summer', 
        last_name: 'Zhu',
        email: 'test@gmail.com',
        password: 'testtesttest',
        password_confirmation: 'testtesttest')
      @user.save
      @check = User.authenticate_with_credentials("test@gmail.com", 'password')
      expect(@check).to eq nil
    end

    # it 'returns a user when use email with capitalized letter' do
    #   @user = User.new(
    #     first_name: 'Summer', 
    #     last_name: 'Zhu',
    #     email: 'test@gmail.com',
    #     password: 'testtesttest',
    #     password_confirmation: 'testtesttest')
    #   @user.save
    #   @check = User.authenticate_with_credentials("TEST@gmail.com", 'testtesttest')
    #   expect(@check).to eq(@user)
    # end

    #   it 'returns a user when use email with whitespace' do
    #   @user = User.new(
    #     first_name: 'Summer', 
    #     last_name: 'Zhu',
    #     email: 'test@gmail.com',
    #     password: 'testtesttest',
    #     password_confirmation: 'testtesttest')
    #   @user.save
    #   @check = User.authenticate_with_credentials(" test@gmail.com ", 'testtesttest')
    #   expect(@check).to eq(@user)
    # end
  end
end
