class ConjuredItem < Item

  def update_quality
    @quality -= 2 if @quality > 2
  end

  def update_sell_in
    @sell_in -= 1
  end
end
