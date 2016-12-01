require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    before(:each) do
      @items = [Item.new("honey", 10, 10)]
    end

    it "does not change the name" do
      GildedRose.new(@items).update_quality()
      expect(@items[0].name).to eq "honey"
    end

    it "lowers item quality by one" do
      GildedRose.new(@items).update_quality()
      expect(@items[0].quality).to eq 9
    end
  end

end
