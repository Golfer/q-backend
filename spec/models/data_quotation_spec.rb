describe DataQuotation, type: :model do
  subject { build(:data_quotation) }

  describe 'included fields' do
    it { is_expected.to respond_to(:link_to_external_resource) }
    it { is_expected.to respond_to(:description) }
  end

  describe 'relations' do
    it { is_expected.to have_many(:quotations) }
  end

  describe 'validates' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it { expect(subject).to validate_presence_of(:link_to_external_resource) }

    it 'is invalid without a link_to_external_resource' do
      data_quotation = DataQuotation.new(description: FFaker::Lorem.paragraphs(1).first)
      data_quotation.valid?
      expect(data_quotation.errors[:link_to_external_resource]).to include("can't be blank")
    end
  end
end
