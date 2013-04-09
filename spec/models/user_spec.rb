# spec/models/user.rb

require 'spec_helper'
require 'cancan/matchers'

describe User do

  describe '.create' do
    context 'given valid information' do
      it 'has a valid factory' do
        create(:user).should be_valid
      end
    end

    context 'given invalid information' do
      it 'is invalid without email' do
        build(:user, email: nil).should_not be_valid
      end

      it 'is invalid without password' do
        build(:user, password: nil).should_not be_valid
      end

      it 'is invalid without password_confirmation' do
        build(:user, password_confirmation: nil).should_not be_valid
      end
    end
  end

  describe '#admin' do

    let(:user) { create(:user) }

    it 'respond to admin? method' do
      user.should respond_to :admin?
    end

    it 'respond with false to admin?' do
      expect(user.admin?).to eq false
    end
  end

  describe 'abilities' do
    subject { ability }
    let(:ability){ Ability.new(user) }
    let(:user) { nil}

    context 'when is signed in' do
      let(:user) { create(:user)}

      it 'can read itself' do
        should be_able_to(:read, user)
      end
      it 'can update itself' do
        should be_able_to(:update, user)
      end
      it 'can edit itself' do
        should be_able_to(:edit, user)
      end
      it 'can access its settings' do
        should be_able_to(:settings, user)
      end
      it 'can destroy itself' do
        should be_able_to(:destroy, user)
      end

      it 'cannot reads another user'
      it 'cannot edit another user'
      it 'cannot update another user'
      it 'cannot access another user #settings'
      it 'cannot destroy another user'
    end
  end
end