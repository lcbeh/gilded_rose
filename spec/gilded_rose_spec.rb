require 'gilded_rose'
require 'item'
require 'conjured_item'

describe GildedRose do

  describe "#update_quality" do
    context "for general items" do
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
        new_item = [Item.new("mango",-1, 10)]
        GildedRose.new(new_item).update_quality
        expect(new_item[0].quality).to eq 8
      end
    end

    context "for Aged Brie" do
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

    context "for Sulfuras" do
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

    context "for Backstage passes" do
      before(:each) do
        @items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 20, 20)]
        @gilded_rose = GildedRose.new(@items)
      end

      it "increase backstage passes quality value by 1 if sell_in is more than 10" do
        @gilded_rose.update_quality
        expect(@items[0].quality).to eq 21
      end

      it "increase backstage passes quality value by 2 if sell_in is less than 10 but greater than 5" do
        11.times { @gilded_rose.update_quality }
        expect(@items[0].quality).to eq 32
      end

      it "increase backstage passes quality value by 3 if sell_in is 5 or less" do
        16.times { @gilded_rose.update_quality }
        p @items[0].sell_in
        expect(@items[0].quality).to eq 43
      end

      it "drops backstage passes quality value to zero when sell_in is less than 0" do
        25.times { @gilded_rose.update_quality }
        expect(@items[0].quality).to eq 0
      end
    end

    context "for conjured items" do
      it "can detect conjured items" do
        conjured_items = [ConjuredItem.new("wand",1, 10)]
        GildedRose.new(conjured_items)
        expect(conjured_items[0].is_a?ConjuredItem).to be true
      end

      it "drops quality value twice as fast as common items" do
        conjured_items = [ConjuredItem.new("wand",1, 10)]
        GildedRose.new(conjured_items).update_quality
        expect(conjured_items[0].quality).to eq 8
      end
    end

  end

end
