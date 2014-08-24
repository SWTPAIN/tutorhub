require 'rails_helper'


RSpec.describe Tutor, :type => :model do
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:education_level) }
  it { should validate_presence_of(:institute) }
  it { should have_many(:jobs) }
  it { should have_many(:employers)}

  describe "#set_featured" do
    it "set user to be featured" do
      tutor = Fabricate(:tutor, featured: false )
      tutor.set_featured
      expect(tutor.reload.featured?).to be true
    end
  end


  describe "#set_not_featured" do
    it "set user to not be featured" do
      tutor = Fabricate(:tutor, featured: true )
      tutor.set_not_featured
      expect(tutor.reload.featured?).to be false
    end
  end


  describe '#subjects' do
    it 'returns the array of subjects names when the user has subjects' do

      tutor = Fabricate(:tutor)
      subject1 = Subject.create(name: "M1", category_name: "Mathemtics")
      subject2 = Subject.create(name: "M2", category_name: "Mathemtics")
      subject3 = Subject.create(name: "English Literature", category_name: "English")
      tutor.subject_tags.create(subject: subject1)
      tutor.subject_tags.create(subject: subject2)
      tutor.subject_tags.create(subject: subject3)

      expect(tutor.subjects).to match_array(["M1", "M2", "English Literature"])

    end

    it 'return nil when the user has no subject' do
      tutor = Fabricate(:tutor)

      expect(tutor.subjects).to be_empty

    end
  end

  describe '#subjects=' do
    it 'sets the user subjects given array of subject names' do

      tutor = Fabricate(:tutor)
      subject1 = Subject.create(name: "M1", category_name: "Mathemtics")
      subject2 = Subject.create(name: "M2", category_name: "Mathemtics")
      subject3 = Subject.create(name: "English Literature", category_name: "English")

      tutor.subjects = ["M1", "M2", "English Literature"]
      expect(tutor.subjects).to match_array(["M1", "M2", "English Literature"])

    end

    it 'does not set the tutor subject when the array of subject name is not present' do
      tutor = Fabricate(:tutor)

      tutor.subjects = ["M1", "M2", "English Literature"]
      expect(tutor.subjects).to be_empty
    end
  end

end
