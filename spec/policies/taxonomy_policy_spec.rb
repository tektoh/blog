require 'rails_helper'

RSpec.describe TaxonomyPolicy do
  subject { described_class }

  let(:taxonomy) { create :taxonomy }

  context 'for a writer' do
    let(:user) { create :user, :writer }

    permissions :index? do
      it { expect(subject).not_to permit(user, taxonomy) }
    end

    permissions :show? do
      it { expect(subject).not_to permit(user, taxonomy) }
    end

    permissions :new? do
      it { expect(subject).not_to permit(user, taxonomy) }
    end

    permissions :create? do
      it { expect(subject).not_to permit(user, taxonomy) }
    end

    permissions :edit? do
      it { expect(subject).not_to permit(user, taxonomy) }
    end

    permissions :update? do
      it { expect(subject).not_to permit(user, taxonomy) }
    end

    permissions :destroy? do
      it { expect(subject).not_to permit(user, taxonomy) }
    end
  end

  context 'for an editor' do
    let(:user) { create :user, :editor }

    permissions :index? do
      it { expect(subject).to permit(user, taxonomy) }
    end

    permissions :show? do
      it { expect(subject).not_to permit(user, taxonomy) }
    end

    permissions :new? do
      it { expect(subject).to permit(user, taxonomy) }
    end

    permissions :create? do
      it { expect(subject).to permit(user, taxonomy) }
    end

    permissions :edit? do
      it { expect(subject).to permit(user, taxonomy) }
    end

    permissions :update? do
      it { expect(subject).to permit(user, taxonomy) }
    end

    permissions :destroy? do
      it { expect(subject).to permit(user, taxonomy) }
    end
  end

  context 'for an admin' do
    let(:user) { create :user, :admin }

    permissions :index? do
      it { expect(subject).to permit(user, taxonomy) }
    end

    permissions :show? do
      it { expect(subject).not_to permit(user, taxonomy) }
    end

    permissions :new? do
      it { expect(subject).to permit(user, taxonomy) }
    end

    permissions :create? do
      it { expect(subject).to permit(user, taxonomy) }
    end

    permissions :edit? do
      it { expect(subject).to permit(user, taxonomy) }
    end

    permissions :update? do
      it { expect(subject).to permit(user, taxonomy) }
    end

    permissions :destroy? do
      it { expect(subject).to permit(user, taxonomy) }
    end
  end
end
