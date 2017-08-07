require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do

  it "Should not save if there is no email" do
    @user = User.new(
      first_name: "First Name",
      last_name: "Last Name",
      password: "Password",
      password_confirmation: "Password"
      )
    expect(@user.valid?).to be (false)
  end

  it "Should not save if the email is not unique" do
    @user = User.new(
      first_name: "First Name",
      last_name: "Last Name",
      email: "user@example.com",
      password: "Password",
      password_confirmation: "Password"
      )
    @user.save
    # This is how you create a user and save it to the database
    # so you can check against it.
    @user2 = User.new(
      first_name: "First Name 2",
      last_name: "Last Name 2",
      email: "user@example.com",
      password: "Password 2",
      password_confirmation: "Password 2"
      )
    expect(@user2.valid?).to be (false)
    # expect(@user.errors.messages).to eq({:email=>["is not unique"]})
    # @user.errors.messages
  end

  it "Should not save if there is no first name" do
    @user = User.new(
      last_name: "Last Name",
      email: "email@example.com",
      password: "Password",
      password_confirmation: "Password"
      )
    expect(@user.valid?).to be (false)
  end

  it "Should not save if there is no last name" do
    @user = User.new(
      first_name: "First Name",
      email: "email@example.com",
      password: "Password",
      password_confirmation: "Password"
      )
    expect(@user.valid?).to be (false)
  end

  it "Should not save if there is no password and password confirmation" do
    @user = User.new(
      first_name: "First Name",
      last_name: "Last Name",
      email: "email@example.com"
      )
    expect(@user.valid?).to be (false)
  end

  it "Should not save if the password is less than minimum length of 4 characters" do
    @user = User.new(
      first_name: "First Name",
      last_name: "Last Name",
      email: "user@example.com",
      password: "ABC",
      password_confirmation: "ABC"
      )
    expect(@user.valid?).to be (false)
  end

  end


  describe '.authenticate_with_credentials' do
    before do
      @user = User.new(
      first_name: "First Name",
      last_name: "Last Name",
      email: "user@example.com",
      password: "ABCDE",
      password_confirmation: "ABCDE"
    )
      @user.save!
    end

  it "Should authenticate with proper credentials" do
    puts User.authenticate_with_credentials(@user.email, @user.password)
      expect(User.authenticate_with_credentials(@user.email, @user.password)).to eq(@user)
  end

  it "Should authenticate with spaces in email" do
    expect(User.authenticate_with_credentials(" user@example.com ", @user.password)).to eq(@user)
  end

  it "Should authenticate regardless of email case" do
    expect(User.authenticate_with_credentials("USER@example.com", @user.password)).to eq(@user)
  end


  end
end

