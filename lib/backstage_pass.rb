class BackstagePass < Item
  def update_quality
    if @sell_in < 0
      @quality = 0
    else
      @quality += 1 if @sell_in < 50
      @quality += 1 if @sell_in < 11
      @quality += 1 if @sell_in < 6
    end
  end

  def update_sell_in
    @sell_in -= 1
  end
end
