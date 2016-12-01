class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name == "Sulfuras, Hand of Ragnaros"
        #do nothing
      else



        if item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert"
          if item.quality > 0
            item.quality -= 1
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
            if item.name == "Backstage passes to a TAFKAL80ETC concert"
              item.quality += 1 if item.sell_in < 11
              item.quality += 1 if item.sell_in < 6
            end
          end
        end


          item.sell_in = item.sell_in - 1



        if item.sell_in < 0
          if item.name != "Aged Brie"
            if item.name != "Backstage passes to a TAFKAL80ETC concert"
              if item.quality > 0
                item.quality = item.quality - 1
              end
            else
              item.quality = item.quality - item.quality #backstage pass
            end
          else
            if item.quality < 50
              item.quality = item.quality + 1
            end
          end
        end
      end

    end

  end

end
