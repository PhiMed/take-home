require "rails_helper"

describe Tea, type: :model do
  describe "relationships" do
    it { should belong_to :subscription }
  end
end