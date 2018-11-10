# == Schema Information
#
# Table name: taxonomies
#
#  id          :bigint(8)        not null, primary key
#  type        :string
#  name        :string
#  slug        :string
#  icon        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_taxonomies_on_slug  (slug)
#  index_taxonomies_on_type  (type)
#

require 'rails_helper'

RSpec.describe Taxonomy, type: :model do
  let(:taxonomy) { Taxonomy.new }

  it { expect(taxonomy).to respond_to(:author?) }
  it { expect(taxonomy).to respond_to(:category?) }
  it { expect(taxonomy).to respond_to(:tag?) }

  context 'Author' do
    let(:taxonomy) { Author.new }

    describe('#type') do
      it { expect(taxonomy.type).to eq 'Author' }
    end

    describe('#author?') do
      it { expect(taxonomy.author?).to be true }
    end

    describe('#category?') do
      it { expect(taxonomy.category?).to be false }
    end

    describe('#tag?') do
      it { expect(taxonomy.tag?).to be false }
    end
  end

  context 'Category' do
    let(:taxonomy) { Category.new }

    describe('#type') do
      it { expect(taxonomy.type).to eq 'Category' }
    end

    describe('#author?') do
      it { expect(taxonomy.author?).to be false }
    end

    describe('#category?') do
      it { expect(taxonomy.category?).to be true }
    end

    describe('#tag?') do
      it { expect(taxonomy.tag?).to be false }
    end
  end

  context 'Tag' do
    let(:taxonomy) { Tag.new }

    describe('#type') do
      it { expect(taxonomy.type).to eq 'Tag' }
    end

    describe('#author?') do
      it { expect(taxonomy.author?).to be false }
    end

    describe('#category?') do
      it { expect(taxonomy.category?).to be false }
    end

    describe('#tag?') do
      it { expect(taxonomy.tag?).to be true }
    end
  end
end
