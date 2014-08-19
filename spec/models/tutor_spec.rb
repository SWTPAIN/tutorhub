require 'rails_helper'


RSpec.describe Tutor, :type => :model do
  it { should validates_presence_of(:description)}
  it { should validates_presence_of(:education_level)}
  it { should validates_presence_of(:institute)}
  it { should validates_presence_of(:gender)}

end
