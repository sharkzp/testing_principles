class GildedRose
  def initialize(items)
    @items = items.map do |item|
      if item.name == 'Aged Brie'
        AgedBrieItem.new(item.name, item.sell_in, item.quality)
      elsif item.name == "Sulfuras, Hand of Ragnaros"
        SulfurasItem.new(item.name, item.sell_in, item.quality)
      elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
        BackstageItem.new(item.name, item.sell_in, item.quality)
      else
        item
      end
    end
  end

  def update_quality()
    @items.each do |item|
      item.update_quality
    end
    @items
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update_quality
    if @quality > 0
      @quality = @quality - 1
    end
    @sell_in = @sell_in - 1

    if @sell_in < 0
      if @quality > 0
        @quality = @quality - 1
      end
    end
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

class BackstageItem < Item
  def update_quality
    if @quality < 50
      @quality = @quality + 1

      if @sell_in < 11
        if @quality < 50
          @quality = @quality + 1
        end
      end
      if @sell_in < 6
        if @quality < 50
          @quality = @quality + 1
        end
      end
    end

    @sell_in = @sell_in - 1

    if @sell_in < 0
      @quality = 0
    end
  end
end

class AgedBrieItem < Item
  def update_quality
    if @quality < 50
      @quality = @quality + 1
    end

    @sell_in = @sell_in - 1

    if @sell_in < 0
      if @quality < 50
        @quality = @quality + 1
      end
    end
  end
end

class SulfurasItem < Item
  def update_quality
  end
end
