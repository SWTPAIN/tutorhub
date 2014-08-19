require 'rails_helper'


RSpec.describe User, :type => :model do
  it { should have_secure_password }
  it { should validates_presence_of(:email)}
  it { should validates_presence_of(:name)}
  it { should validates_uniqueness_of(:email)}
end
