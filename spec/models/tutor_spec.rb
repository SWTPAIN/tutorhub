require 'rails_helper'


RSpec.describe Tutor, :type => :model do
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:education_level) }
  it { should validate_presence_of(:institute) }
  it { should have_many(:jobs) }
  it { should have_many(:employers)}

  describe "has many subject_tags" do
    it "can create subject_tags" do
      tutor = Fabricate(:tutor)
      subject = Fabricate(:subject)
      binding.pry
      tutor.subject_tags.create(subject: subject)
      expect(tutor.reload.subject_tags).to eq([subject])

    end

  end


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


end
