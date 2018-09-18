require 'rails_helper'
require 'capybara/rails'

RSpec.describe User, type: :model do
  describe "Validations" do
    before do
      @user = User.create(first_name: "Xi", last_name: "Yu", email: "XYU20@art.edu", password: "abc", password_confirmation: "abc")

    end

    it "should be invalid because the password does not match" do
      @user.password_confirmation = "123"
      expect(@user).to_not be_valid
    end

    it "should be invalid because the email should be case sensitive" do
      user = User.create(first_name: "Xi", last_name: "Yu", email: "xyu20@ART.edu", password: "abc", password_confirmation: "abc")
      expect(user).to_not be_valid
    end

    it 'should not be valid since email is not valid' do
      @user.email = nil
      expect(@user).to_not be_valid

    end

    it 'should not be valid since first_name is not valid' do
      @user.first_name = nil
      expect(@user).to_not be_valid

    end

    it 'should not be valid since last_name is not valid' do
      @user.last_name = nil
      expect(@user).to_not be_valid

    end

    it 'should not be valid since the length of password is one' do
      @user.password = "a"
      expect(@user).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    before do
      @user = User.create(first_name: "Xi", last_name: "Yu", email: "xyu20@art.edu", password: "abcd", password_confirmation: "abcd")
    end

    it 'should give me an user' do
      @test_user = User.authenticate_with_credentials("XYU20@art.edu", "abcd")

      expect(@test_user).to eq(@user)
    end

    it 'should not be valid since the email has a space' do
      @test_user = User.authenticate_with_credentials(" XYU20@art.edu ", "abcd")

      expect(@test_user).to eq(@user)
    end

    it 'should not be allowed since email is wrong case' do
      @test_user = User.authenticate_with_credentials("xyu20@ART.EDU", "abcd")

      expect(@test_user).to eq(@user)
    end
  end







end