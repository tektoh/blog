require 'rails_helper'

RSpec.describe TaxonomyPolicy do
  subject { described_class }

  let(:taxonomy) { create :taxonomy }

  context 'for a writer' do
    let(:user) { create :user, :writer }

    permissions(:index?)   { it { is_expected.not_to permit(user, taxonomy) } }
    permissions(:show?)    { it { is_expected.not_to permit(user, taxonomy) } }
    permissions(:new?)     { it { is_expected.not_to permit(user, taxonomy) } }
    permissions(:create?)  { it { is_expected.not_to permit(user, taxonomy) } }
    permissions(:edit?)    { it { is_expected.not_to permit(user, taxonomy) } }
    permissions(:update?)  { it { is_expected.not_to permit(user, taxonomy) } }
    permissions(:destroy?) { it { is_expected.not_to permit(user, taxonomy) } }
  end

  context 'for an editor' do
    let(:user) { create :user, :editor }

    permissions(:index?)   { it { is_expected.to permit(user, taxonomy) } }
    permissions(:show?)    { it { is_expected.not_to permit(user, taxonomy) } }
    permissions(:new?)     { it { is_expected.to permit(user, taxonomy) } }
    permissions(:create?)  { it { is_expected.to permit(user, taxonomy) } }
    permissions(:edit?)    { it { is_expected.to permit(user, taxonomy) } }
    permissions(:update?)  { it { is_expected.to permit(user, taxonomy) } }
    permissions(:destroy?) { it { is_expected.to permit(user, taxonomy) } }
  end

  context 'for an admin' do
    let(:user) { create :user, :admin }

    permissions(:index?)   { it { is_expected.to permit(user, taxonomy) } }
    permissions(:show?)    { it { is_expected.not_to permit(user, taxonomy) } }
    permissions(:new?)     { it { is_expected.to permit(user, taxonomy) } }
    permissions(:create?)  { it { is_expected.to permit(user, taxonomy) } }
    permissions(:edit?)    { it { is_expected.to permit(user, taxonomy) } }
    permissions(:update?)  { it { is_expected.to permit(user, taxonomy) } }
    permissions(:destroy?) { it { is_expected.to permit(user, taxonomy) } }
  end
end
