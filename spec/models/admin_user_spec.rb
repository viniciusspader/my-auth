# spec/models/admin_user.rb

require 'spec_helper'

describe AdminUser do
  describe '.create' do
    context 'with valid information' do
      it 'has a valid factory' do
        FactoryGirl.create(:admin_user).should be_valid
      end
    end

    context 'with invalid information' do
      it 'is invalid without email' do
        FactoryGirl.build(:admin_user, email: nil).should_not be_valid
      end

      it 'is invalid without password' do
        FactoryGirl.build(:admin_user, password: nil).should_not be_valid
      end
      it 'is invalid with invalid password' do
        FactoryGirl.build(:admin_user, password: 123).should_not be_valid
      end
    end
  end

  describe '#admin' do

    let(:admin_user) { FactoryGirl.create(:admin_user) }

    it 'responds to admin?' do
      admin_user.should respond_to :admin?
    end

    it 'responds with true to admin?' do
      expect(admin_user.admin?).to eq true
    end
  end
end