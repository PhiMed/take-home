require "rails_helper"

describe Subscription, type: :model do
  describe "relationships" do
    it { should belong_to :customer}
    it { should belong_to :tea }
  end
end
