require 'rails_helper'

RSpec.describe SitePolicy do
  subject { described_class }

  let(:site) { create :site }

  context 'for a writer' do
    let(:user) { create :user, :writer }

    permissions :index? do
      it { expect(subject).not_to permit(user, site) }
    end

    permissions :show? do
      it { expect(subject).not_to permit(user, site) }
    end

    permissions :new? do
      it { expect(subject).not_to permit(user, site) }
    end

    permissions :create? do
      it { expect(subject).not_to permit(user, site) }
    end

    permissions :edit? do
      it { expect(subject).not_to permit(user, site) }
    end

    permissions :update? do
      it { expect(subject).not_to permit(user, site) }
    end

    permissions :destroy? do
      it { expect(subject).not_to permit(user, site) }
    end
  end

  context 'for an editor' do
    let(:user) { create :user, :editor }

    permissions :index? do
      it { expect(subject).not_to permit(user, site) }
    end

    permissions :show? do
      it { expect(subject).not_to permit(user, site) }
    end

    permissions :new? do
      it { expect(subject).not_to permit(user, site) }
    end

    permissions :create? do
      it { expect(subject).not_to permit(user, site) }
    end

    permissions :edit? do
      it { expect(subject).not_to permit(user, site) }
    end

    permissions :update? do
      it { expect(subject).not_to permit(user, site) }
    end

    permissions :destroy? do
      it { expect(subject).not_to permit(user, site) }
    end
  end

  context 'for an admin' do
    let(:user) { create :user, :admin }

    permissions :index? do
      it { expect(subject).not_to permit(user, site) }
    end

    permissions :show? do
      it { expect(subject).not_to permit(user, site) }
    end

    permissions :new? do
      it { expect(subject).not_to permit(user, site) }
    end

    permissions :create? do
      it { expect(subject).not_to permit(user, site) }
    end

    permissions :edit? do
      it { expect(subject).to permit(user, site) }
    end

    permissions :update? do
      it { expect(subject).to permit(user, site) }
    end

    permissions :destroy? do
      it { expect(subject).not_to permit(user, site) }
    end
  end
end
