require 'rails_helper'

RSPec.describe MovieActor, type: :model do

  describe "relationships" do
    it {should belong_to :actor}
    it {should belong_to :movie}
  end
end
