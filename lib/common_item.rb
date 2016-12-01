class CommonItem < Item

  def update_quality
    if @quality > 0
      @quality -= 2 if @sell_in < 0
      @quality -= 1 if @sell_in >= 0
    end
  end

  def update_sell_in
    @sell_in -= 1
  end
end
