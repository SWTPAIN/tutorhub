require 'rails_helper'


RSpec.describe Employer, :type => :model do

  it { should have_many(:cases) }
  it { should have_many(:jobs) }
  it { should have_many(:tutors) }

end
