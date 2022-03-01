require "rails_helper"

describe Subscription, type: :model do
  describe "relationships" do
    it { should have_many :customer_subscriptions }
    it { should have_many :customers }
    it { should have_many :teas }
  end
end
