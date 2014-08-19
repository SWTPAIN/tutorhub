require 'rails_helper'


RSpec.describe Tutor, :type => :model do
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:education_level) }
  it { should validate_presence_of(:institute) }
  it { should validate_presence_of(:gender) }
  it { should have_many(:jobs) }
  it { should have_many(:employers)}


end
