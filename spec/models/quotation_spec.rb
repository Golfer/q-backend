describe Quotation, type: :model do
  subject { build(:quotation) }

  describe 'included fields' do
    it { is_expected.to respond_to(:body) }
    it { is_expected.to respond_to(:title) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:author) }
    it { is_expected.to belong_to(:data_quotation) }
  end

  describe 'validates' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it { expect(subject).to validate_presence_of(:body) }

    it 'is invalid without a link_to_external_resource' do
      quotation = Quotation.new(title: Faker::Name.name)
      quotation.valid?
      expect(quotation.errors[:body]).to include("can't be blank")
    end
  end
end
