class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name == 'Aged Brie'
        item.update_aged_brie_quality
      elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
        item.update_backstage_passes
      elsif item.name == "Sulfuras, Hand of Ragnaros"
        item.update_sulfuras
      else
        item.update_quality
      end
    end
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

  def update_sulfuras
  end

  def update_backstage_passes
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

  def update_aged_brie_quality
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

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
