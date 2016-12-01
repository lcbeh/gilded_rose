class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      item.update_quality
      item.update_sell_in
    end
  end

  # def update_conjured_item(item)
  #   item.quality -= 2 if item.quality > 2
  # end

  # def update_sulfuras(item)
  #   item.sell_in += 1 #to ensure value remains when sell_in is deducted from all items
  # end

  # def update_age_brie(item)
  #   item.quality += 1 if item.quality < 50
  # end

  # def update_backstage_passes(item)
  #   if item.sell_in < 0
  #     item.quality -= item.quality
  #   else
  #     item.quality += 1 if item.sell_in < 50
  #     item.quality += 1 if item.sell_in < 11
  #     item.quality += 1 if item.sell_in < 6
  #   end
  # end

  # def update_common_item(item)
  #   item.quality -= 2 if item.quality > 0 && item.sell_in < 0
  #   item.quality -= 1 if item.quality > 0 && item.sell_in >= 0
  # end
end
