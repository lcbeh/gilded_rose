class AgedBrie < Item

  def update_quality
    @quality += 1 if @quality < 50
  end

  def update_sell_in
    @sell_in -= 1
  end
end
