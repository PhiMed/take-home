require "rails_helper"

describe CustomerSubscription, type: :model do
  describe "relationships" do
    it { should belong_to :customer }
    it { should belong_to :subscription }
  end
end