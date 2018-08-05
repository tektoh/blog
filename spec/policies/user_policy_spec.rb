require 'rails_helper'

RSpec.describe UserPolicy do
  subject { described_class }

  let(:user) { create :user }

  context 'for a writer' do
    let(:current_user) { create :user, :writer }

    permissions :index? do
      it { expect(subject).to permit(current_user, user) }
    end

    permissions :show? do
      it { expect(subject).to permit(current_user, user) }
    end

    permissions :new? do
      it { expect(subject).not_to permit(current_user, user) }
    end

    permissions :create? do
      it { expect(subject).not_to permit(current_user, user) }
    end

    permissions :edit? do
      it { expect(subject).not_to permit(current_user, user) }
      it { expect(subject).to permit(current_user, current_user) }
    end

    permissions :update? do
      it { expect(subject).not_to permit(current_user, user) }
      it { expect(subject).to permit(current_user, current_user) }
    end

    permissions :destroy? do
      it { expect(subject).not_to permit(current_user, user) }
      it { expect(subject).not_to permit(current_user, current_user) }
    end
  end

  context 'for a editor' do
    let(:current_user) { create :user, :editor }

    permissions :index? do
      it { expect(subject).to permit(current_user, user) }
    end

    permissions :show? do
      it { expect(subject).to permit(current_user, user) }
    end

    permissions :new? do
      it { expect(subject).not_to permit(current_user, user) }
    end

    permissions :create? do
      it { expect(subject).not_to permit(current_user, user) }
    end

    permissions :edit? do
      it { expect(subject).not_to permit(current_user, user) }
      it { expect(subject).to permit(current_user, current_user) }
    end

    permissions :update? do
      it { expect(subject).not_to permit(current_user, user) }
      it { expect(subject).to permit(current_user, current_user) }
    end

    permissions :destroy? do
      it { expect(subject).not_to permit(current_user, user) }
      it { expect(subject).not_to permit(current_user, current_user) }
    end
  end

  context 'for a admin' do
    let(:current_user) { create :user, :admin }

    permissions :index? do
      it { expect(subject).to permit(current_user, user) }
    end

    permissions :show? do
      it { expect(subject).to permit(current_user, user) }
    end

    permissions :new? do
      it { expect(subject).to permit(current_user, user) }
    end

    permissions :create? do
      it { expect(subject).to permit(current_user, user) }
    end

    permissions :edit? do
      it { expect(subject).to permit(current_user, user) }
      it { expect(subject).to permit(current_user, current_user) }
    end

    permissions :update? do
      it { expect(subject).to permit(current_user, user) }
      it { expect(subject).to permit(current_user, current_user) }
    end

    permissions :destroy? do
      it { expect(subject).to permit(current_user, user) }
      it { expect(subject).not_to permit(current_user, current_user) }
    end
  end
end
