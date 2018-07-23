require 'spec_helper'

RSpec.describe(GildedRose) do
  describe '#update_quality' do
    let(:gilded_rose) { GildedRose.new([]) }

    it 'does something' do
      expect(gilded_rose.update_quality).to eq([])
    end
  end
end
