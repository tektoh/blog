require 'rails_helper'

RSpec.describe ArticlePolicy do
  subject { described_class }

  let(:article) { create :article }

  context 'for a writer' do
    let(:user) { create :user, :writer }

    permissions :index? do
      it { expect(subject).to permit(user, article) }
    end

    permissions :show? do
      it { expect(subject).to permit(user, article) }
    end

    permissions :new? do
      it { expect(subject).not_to permit(user, article) }
    end

    permissions :create? do
      it { expect(subject).not_to permit(user, article) }
    end

    permissions :edit? do
      it { expect(subject).to permit(user, article) }
    end

    permissions :update? do
      it { expect(subject).to permit(user, article) }
    end

    permissions :destroy? do
      it { expect(subject).not_to permit(user, article) }
    end
  end

  context 'for a editor' do
    let(:user) { create :user, :editor }

    permissions :index? do
      it { expect(subject).to permit(user, article) }
    end

    permissions :show? do
      it { expect(subject).to permit(user, article) }
    end

    permissions :new? do
      it { expect(subject).to permit(user, article) }
    end

    permissions :create? do
      it { expect(subject).to permit(user, article) }
    end

    permissions :edit? do
      it { expect(subject).to permit(user, article) }
    end

    permissions :update? do
      it { expect(subject).to permit(user, article) }
    end

    permissions :destroy? do
      it { expect(subject).to permit(user, article) }
    end
  end

  context 'for an admin' do
    let(:user) { create :user, :admin }

    permissions :index? do
      it { expect(subject).to permit(user, article) }
    end

    permissions :show? do
      it { expect(subject).to permit(user, article) }
    end

    permissions :new? do
      it { expect(subject).to permit(user, article) }
    end

    permissions :create? do
      it { expect(subject).to permit(user, article) }
    end

    permissions :edit? do
      it { expect(subject).to permit(user, article) }
    end

    permissions :update? do
      it { expect(subject).to permit(user, article) }
    end

    permissions :destroy? do
      it { expect(subject).to permit(user, article) }
    end
  end
end
