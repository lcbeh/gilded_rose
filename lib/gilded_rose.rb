class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name == "Sulfuras, Hand of Ragnaros"
        update_sulfuras(item)
      elsif item.name == "Aged Brie"
        update_age_brie(item)
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        update_backstage_passes(item)
      else
        update_common_item(item)
      end
      item.sell_in -= 1
    end
  end

  def update_common_item(item)
    item.quality -= 2 if item.quality > 0 && item.sell_in < 0
    item.quality -= 1 if item.quality > 0 && item.sell_in >= 0
  end

  def update_sulfuras(item)
    item.sell_in += 1
  end

  def update_age_brie(item)
    item.quality += 1 if item.quality < 50
  end

  def update_backstage_passes(item)
    if item.sell_in < 0
      item.quality -= item.quality
    else
      item.quality += 1 if item.sell_in < 50
      item.quality += 1 if item.sell_in < 11
      item.quality += 1 if item.sell_in < 6
    end
  end

end
