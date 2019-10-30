require 'rails_helper'

RSpec.describe UserPolicy do
  subject { described_class }

  let(:user) { create :user }

  context 'for a writer' do
    let(:current_user) { create :user, :writer }
    permissions(:index?)   { it { is_expected.to permit(current_user, user) } }
    permissions(:show?)    { it { is_expected.to permit(current_user, user) } }
    permissions(:new?)     { it { is_expected.not_to permit(current_user, user) } }
    permissions(:create?)  { it { is_expected.not_to permit(current_user, user) } }
    permissions(:edit?)    { it { is_expected.not_to permit(current_user, user) } }
    permissions(:update?)  { it { is_expected.not_to permit(current_user, user) } }
    permissions(:destroy?) { it { is_expected.not_to permit(current_user, user) } }

    permissions(:show?)    { it { is_expected.to permit(current_user, current_user) } }
    permissions(:edit?)    { it { is_expected.to permit(current_user, current_user) } }
    permissions(:update?)  { it { is_expected.to permit(current_user, current_user) } }
    permissions(:destroy?) { it { is_expected.not_to permit(current_user, current_user) } }
  end

  context 'for a editor' do
    let(:current_user) { create :user, :editor }

    permissions(:index?)   { it { is_expected.to permit(current_user, user) } }
    permissions(:show?)    { it { is_expected.to permit(current_user, user) } }
    permissions(:new?)     { it { is_expected.not_to permit(current_user, user) } }
    permissions(:create?)  { it { is_expected.not_to permit(current_user, user) } }
    permissions(:edit?)    { it { is_expected.not_to permit(current_user, user) } }
    permissions(:update?)  { it { is_expected.not_to permit(current_user, user) } }
    permissions(:destroy?) { it { is_expected.not_to permit(current_user, user) } }

    permissions(:show?)    { it { is_expected.to permit(current_user, current_user) } }
    permissions(:edit?)    { it { is_expected.to permit(current_user, current_user) } }
    permissions(:update?)  { it { is_expected.to permit(current_user, current_user) } }
    permissions(:destroy?) { it { is_expected.not_to permit(current_user, current_user) } }
  end

  context 'for a admin' do
    let(:current_user) { create :user, :admin }

    permissions(:index?)   { it { is_expected.to permit(current_user, user) } }
    permissions(:show?)    { it { is_expected.to permit(current_user, user) } }
    permissions(:new?)     { it { is_expected.to permit(current_user, user) } }
    permissions(:create?)  { it { is_expected.to permit(current_user, user) } }
    permissions(:edit?)    { it { is_expected.to permit(current_user, user) } }
    permissions(:update?)  { it { is_expected.to permit(current_user, user) } }
    permissions(:destroy?) { it { is_expected.to permit(current_user, user) } }

    permissions(:show?)    { it { is_expected.to permit(current_user, current_user) } }
    permissions(:edit?)    { it { is_expected.to permit(current_user, current_user) } }
    permissions(:update?)  { it { is_expected.to permit(current_user, current_user) } }
    permissions(:destroy?) { it { is_expected.not_to permit(current_user, current_user) } }
  end
end
