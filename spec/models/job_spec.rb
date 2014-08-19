require 'rails_helper'


RSpec.describe Job, :type => :model do

  it { should belong_to(:employer) }
  it { should belong_to(:tutor) }

end
