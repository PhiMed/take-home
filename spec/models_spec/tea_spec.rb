require "rails_helper"

describe Tea, type: :model do
  describe "relationships" do
    it { should have_many :subscriptions}
    it { should have_many :customers}
  end
end