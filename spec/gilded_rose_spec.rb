require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    context "general items" do
      before(:each) do
        @items = [Item.new("honey", 5, 10)]
        @gilded_rose = GildedRose.new(@items)
      end

      it "does not change the name" do
        @gilded_rose.update_quality()
        expect(@items[0].name).to eq "honey"
      end

      it "lowers common items sell_in day by one" do
        @gilded_rose.update_quality()
        expect(@items[0].sell_in).to eq 4
      end

      it "lowers common items quality value by one" do
        @gilded_rose.update_quality()
        expect(@items[0].quality).to eq 9
      end

      it "checks all quality value cannot be negative" do
        12.times { @gilded_rose.update_quality }
        expect(@items[0].quality).to eq 0
      end

      it "drops common items quality value by 2 if sell by date has passed" do
        6.times { @gilded_rose.update_quality }
        expect(@items[0].quality).to eq 3
      end
    end

    context "Aged Brie" do
      before(:each) do
        @items = [Item.new("Aged Brie", 10, 40)]
        @gilded_rose = GildedRose.new(@items)
      end

      it "adds quality value of aged brie by one" do
        @gilded_rose.update_quality
        expect(@items[0].quality).to eq 41
      end

      it "ensures all quality value cannot be more than 50"  do
        100.times { @gilded_rose.update_quality }
        expect(@items[0].quality).to eq 50
      end
    end

    context "Sulfuras" do
      before(:each) do
        @items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 40)]
        @gilded_rose = GildedRose.new(@items)
      end

      it "doesn't change Sulfuras sell_in day" do
        @gilded_rose.update_quality
        expect(@items[0].sell_in).to eq 10
      end

      it "doesn't change Sulfuras quality" do
        @gilded_rose.update_quality
        expect(@items[0].quality).to eq 40
      end
    end

  end

end
