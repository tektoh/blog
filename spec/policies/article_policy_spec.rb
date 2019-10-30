require 'rails_helper'

RSpec.describe ArticlePolicy do
  subject { described_class }

  let(:article) { create :article }

  context 'for a writer' do
    let(:user) { create :user, :writer }

    permissions(:index?)   { it { is_expected.to permit(user, article) } }
    permissions(:show?)    { it { is_expected.to permit(user, article) } }
    permissions(:new?)     { it { is_expected.not_to permit(user, article) } }
    permissions(:create?)  { it { is_expected.not_to permit(user, article) } }
    permissions(:edit?)    { it { is_expected.to permit(user, article) } }
    permissions(:update?)  { it { is_expected.to permit(user, article) } }
    permissions(:destroy?) { it { is_expected.not_to permit(user, article) } }
  end

  context 'for a editor' do
    let(:user) { create :user, :editor }

    permissions(:index?)   { it { is_expected.to permit(user, article) } }
    permissions(:show?)    { it { is_expected.to permit(user, article) } }
    permissions(:new?)     { it { is_expected.to permit(user, article) } }
    permissions(:create?)  { it { is_expected.to permit(user, article) } }
    permissions(:edit?)    { it { is_expected.to permit(user, article) } }
    permissions(:update?)  { it { is_expected.to permit(user, article) } }
    permissions(:destroy?) { it { is_expected.to permit(user, article) } }

  end

  context 'for an admin' do
    let(:user) { create :user, :admin }

    permissions(:index?)   { it { is_expected.to permit(user, article) } }
    permissions(:show?)    { it { is_expected.to permit(user, article) } }
    permissions(:new?)     { it { is_expected.to permit(user, article) } }
    permissions(:create?)  { it { is_expected.to permit(user, article) } }
    permissions(:edit?)    { it { is_expected.to permit(user, article) } }
    permissions(:update?)  { it { is_expected.to permit(user, article) } }
    permissions(:destroy?) { it { is_expected.to permit(user, article) } }
  end
end
