require 'rails_helper'

RSpec.describe SitePolicy do
  subject { described_class }

  let(:site) { create :site }

  context 'for a writer' do
    let(:user) { create :user, :writer }

    permissions(:index?)   { it { is_expected.not_to permit(user, site) } }
    permissions(:show?)    { it { is_expected.not_to permit(user, site) } }
    permissions(:new?)     { it { is_expected.not_to permit(user, site) } }
    permissions(:create?)  { it { is_expected.not_to permit(user, site) } }
    permissions(:edit?)    { it { is_expected.not_to permit(user, site) } }
    permissions(:update?)  { it { is_expected.not_to permit(user, site) } }
    permissions(:destroy?) { it { is_expected.not_to permit(user, site) } }
  end

  context 'for an editor' do
    let(:user) { create :user, :editor }

    permissions(:index?)   { it { is_expected.not_to permit(user, site) } }
    permissions(:show?)    { it { is_expected.not_to permit(user, site) } }
    permissions(:new?)     { it { is_expected.not_to permit(user, site) } }
    permissions(:create?)  { it { is_expected.not_to permit(user, site) } }
    permissions(:edit?)    { it { is_expected.not_to permit(user, site) } }
    permissions(:update?)  { it { is_expected.not_to permit(user, site) } }
    permissions(:destroy?) { it { is_expected.not_to permit(user, site) } }
  end

  context 'for an admin' do
    let(:user) { create :user, :admin }

    permissions(:index?)   { it { is_expected.not_to permit(user, site) } }
    permissions(:show?)    { it { is_expected.not_to permit(user, site) } }
    permissions(:new?)     { it { is_expected.not_to permit(user, site) } }
    permissions(:create?)  { it { is_expected.not_to permit(user, site) } }
    permissions(:edit?)    { it { is_expected.to permit(user, site) } }
    permissions(:update?)  { it { is_expected.to permit(user, site) } }
    permissions(:destroy?) { it { is_expected.not_to permit(user, site) } }
  end
end
