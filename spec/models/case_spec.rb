require 'rails_helper'


RSpec.describe Case, :type => :model do

  it { should belong_to(:employer)}
end
