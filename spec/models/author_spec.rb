describe Author, type: :model do
  subject { build(:author) }

  describe 'included fields' do
    it { is_expected.to respond_to(:first_name) }
    it { is_expected.to respond_to(:last_name) }
  end

  describe 'relations' do
    it { is_expected.to have_many(:quotations) }
  end

  describe 'validates' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it { expect(subject).to validate_presence_of(:first_name) }

    it 'is invalid without a link_to_external_resource' do
      author = Author.new(short_description: FFaker::Lorem.paragraphs(1).first)
      author.valid?
      expect(author.errors[:first_name]).to include("can't be blank")
    end
  end
end
