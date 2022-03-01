require "rails_helper"

describe Customer, type: :model do
  describe "relationships" do
    it { should have_many :subscriptions }
    it { should have_many :teas }
  end
end
