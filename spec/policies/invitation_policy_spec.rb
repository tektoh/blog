require 'rails_helper'

RSpec.describe InvitationPolicy do
  subject { described_class }

  let(:invitation) { create :invitation }

  context 'for a writer' do
    let(:user) { create :user, :writer }

    permissions :index? do
      it { expect(subject).not_to permit(user, invitation) }
    end

    permissions :show? do
      it { expect(subject).not_to permit(user, invitation) }
    end

    permissions :new? do
      it { expect(subject).not_to permit(user, invitation) }
    end

    permissions :create? do
      it { expect(subject).not_to permit(user, invitation) }
    end

    permissions :edit? do
      it { expect(subject).not_to permit(user, invitation) }
    end

    permissions :update? do
      it { expect(subject).not_to permit(user, invitation) }
    end

    permissions :destroy? do
      it { expect(subject).not_to permit(user, invitation) }
    end
  end

  context 'for an editor' do
    let(:user) { create :user, :editor }

    permissions :index? do
      it { expect(subject).not_to permit(user, invitation) }
    end

    permissions :show? do
      it { expect(subject).not_to permit(user, invitation) }
    end

    permissions :new? do
      it { expect(subject).not_to permit(user, invitation) }
    end

    permissions :create? do
      it { expect(subject).not_to permit(user, invitation) }
    end

    permissions :edit? do
      it { expect(subject).not_to permit(user, invitation) }
    end

    permissions :update? do
      it { expect(subject).not_to permit(user, invitation) }
    end

    permissions :destroy? do
      it { expect(subject).not_to permit(user, invitation) }
    end
  end

  context 'for an admin' do
    let(:user) { create :user, :admin }

    permissions :index? do
      it { expect(subject).to permit(user, invitation) }
    end

    permissions :show? do
      it { expect(subject).to permit(user, invitation) }
    end

    permissions :new? do
      it { expect(subject).to permit(user, invitation) }
    end

    permissions :create? do
      it { expect(subject).to permit(user, invitation) }
    end

    permissions :edit? do
      it { expect(subject).not_to permit(user, invitation) }
    end

    permissions :update? do
      it { expect(subject).not_to permit(user, invitation) }
    end

    permissions :destroy? do
      it { expect(subject).to permit(user, invitation) }
    end
  end
end
