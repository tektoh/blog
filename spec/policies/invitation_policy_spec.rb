require 'rails_helper'

RSpec.describe InvitationPolicy do
  subject { described_class }

  let(:invitation) { create :invitation }

  context 'for a writer' do
    let(:user) { create :user, :writer }

    permissions(:index?)   { it { is_expected.not_to permit(user, invitation) } }
    permissions(:show?)    { it { is_expected.not_to permit(user, invitation) } }
    permissions(:new?)     { it { is_expected.not_to permit(user, invitation) } }
    permissions(:create?)  { it { is_expected.not_to permit(user, invitation) } }
    permissions(:edit?)    { it { is_expected.not_to permit(user, invitation) } }
    permissions(:update?)  { it { is_expected.not_to permit(user, invitation) } }
    permissions(:destroy?) { it { is_expected.not_to permit(user, invitation) } }
  end

  context 'for an editor' do
    let(:user) { create :user, :editor }

    permissions(:index?)   { it { is_expected.not_to permit(user, invitation) } }
    permissions(:show?)    { it { is_expected.not_to permit(user, invitation) } }
    permissions(:new?)     { it { is_expected.not_to permit(user, invitation) } }
    permissions(:create?)  { it { is_expected.not_to permit(user, invitation) } }
    permissions(:edit?)    { it { is_expected.not_to permit(user, invitation) } }
    permissions(:update?)  { it { is_expected.not_to permit(user, invitation) } }
    permissions(:destroy?) { it { is_expected.not_to permit(user, invitation) } }
  end

  context 'for an admin' do
    let(:user) { create :user, :admin }

    permissions(:index?)   { it { is_expected.to permit(user, invitation) } }
    permissions(:show?)    { it { is_expected.to permit(user, invitation) } }
    permissions(:new?)     { it { is_expected.to permit(user, invitation) } }
    permissions(:create?)  { it { is_expected.to permit(user, invitation) } }
    permissions(:edit?)    { it { is_expected.not_to permit(user, invitation) } }
    permissions(:update?)  { it { is_expected.not_to permit(user, invitation) } }
    permissions(:destroy?) { it { is_expected.to permit(user, invitation) } }
  end
end
