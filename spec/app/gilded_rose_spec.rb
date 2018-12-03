require 'spec_helper'

RSpec.describe(GildedRose) do
  describe '#update_quality' do
    let(:gilded_rose) { GildedRose.new([Item.new(name, sell_in, quality)]) }
    let(:item)        { gilded_rose.update_quality.first }
    let(:name)        { 'Normal Item' }
    let(:sell_in)     { 10 }
    let(:quality)     { 10 }

    context 'when sell in below zero' do
      let(:sell_in) { -1 }

      it 'nullify quality but decrease sell_in' do
        aggregate_failures 'testing item properties' do
          expect(item.quality).to eq(8)
          expect(item.sell_in).to eq(-2)
        end
      end

      context 'when quality below zero' do
        let(:quality) { -1 }

        it 'nullify quality but decrease sell_in' do
          aggregate_failures 'testing item properties' do
            expect(item.quality).to eq(-1)
            expect(item.sell_in).to eq(-2)
          end
        end
      end

      context 'when quality above 50' do
        let(:quality) { 51 }

        it 'nullify quality but decrease sell_in' do
          aggregate_failures 'testing item properties' do
            expect(item.quality).to eq(49)
            expect(item.sell_in).to eq(-2)
          end
        end
      end
    end

    context 'when sell in is 5' do
      let(:sell_in) { 5 }

      it 'adds three points to quality but lowers sell in' do
        aggregate_failures 'testing item properties' do
          expect(item.quality).to eq(9)
          expect(item.sell_in).to eq(4)
        end
      end

      context 'when quality below zero' do
        let(:quality) { -1 }

        it 'adds three points to quality but lowers sell in' do
          aggregate_failures 'testing item properties' do
            expect(item.quality).to eq(-1)
            expect(item.sell_in).to eq(4)
          end
        end
      end

      context 'when quality above 50' do
        let(:quality) { 51 }

        it 'does not changes quality but lowers sell in' do
          aggregate_failures 'testing item properties' do
            expect(item.quality).to eq(50)
            expect(item.sell_in).to eq(4)
          end
        end
      end
    end

    context 'when sell in is 10' do
      let(:sell_in) { 10 }

      it 'adds two points to quality but lowers sell_in' do
        aggregate_failures 'testing item properties' do
          expect(item.quality).to eq(9)
          expect(item.sell_in).to eq(9)
        end
      end

      context 'when quality below zero' do
        let(:quality) { -1 }

        it 'adds two points to quality but lowers sell_in' do
          aggregate_failures 'testing item properties' do
            expect(item.quality).to eq(-1)
            expect(item.sell_in).to eq(9)
          end
        end
      end

      context 'when quality above 50' do
        let(:quality) { 51 }

        it 'does not changes quality but lowers sell in' do
          aggregate_failures 'testing item properties' do
            expect(item.quality).to eq(50)
            expect(item.sell_in).to eq(9)
          end
        end
      end
    end

    context 'when sell in is 20' do
      let(:sell_in) { 20 }

      it 'adds one point to quality but lowers sell_in' do
        aggregate_failures 'testing item properties' do
          expect(item.quality).to eq(9)
          expect(item.sell_in).to eq(19)
        end
      end

      context 'when quality below zero' do
        let(:quality) { -1 }

        it 'adds one point to quality but lowers sell_in' do
          aggregate_failures 'testing item properties' do
            expect(item.quality).to eq(-1)
            expect(item.sell_in).to eq(19)
          end
        end
      end

      context 'when quality above 50' do
        let(:quality) { 51 }

        it 'does not change quality but lowers sell_in' do
          aggregate_failures 'testing item properties' do
            expect(item.quality).to eq(50)
            expect(item.sell_in).to eq(19)
          end
        end
      end
    end

    context "when legendary Sulfur app" do
      let(:name) { 'Sulfuras, Hand of Ragnaros' }

      context 'when sell in below zero' do
        let(:sell_in) { -1 }

        it 'never changes quality' do
          aggregate_failures 'testing item properties' do
            expect(item.quality).to eq(10)
            expect(item.sell_in).to eq(-1)
          end
        end

        context 'when quality below zero' do
          let(:quality) { -1 }

          it 'never changes quality' do
            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(-1)
              expect(item.sell_in).to eq(-1)
            end
          end
        end

        context 'when quality above 50' do
          let(:quality) { 51 }

          it 'never changes quality' do
            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(51)
              expect(item.sell_in).to eq(-1)
            end
          end
        end
      end

      context 'when sell in is 5' do
        let(:sell_in) { 5 }

        it 'never changes' do
          aggregate_failures 'testing item properties' do
            expect(item.quality).to eq(10)
            expect(item.sell_in).to eq(5)
          end
        end

        context 'when quality below zero' do
          let(:quality) { -1 }

          it 'never changes quality' do
            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(-1)
              expect(item.sell_in).to eq(5)
            end
          end
        end

        context 'when quality above 50' do
          let(:quality) { 51 }

          it 'never changes quality' do
            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(51)
              expect(item.sell_in).to eq(5)
            end
          end
        end
      end

      context 'when sell in is 10' do
        let(:sell_in) { 10 }

        it 'never changes' do
          aggregate_failures 'testing item properties' do
            expect(item.quality).to eq(10)
            expect(item.sell_in).to eq(10)
          end
        end

        context 'when quality below zero' do
          let(:quality) { -1 }

          it 'never changes quality' do
            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(-1)
              expect(item.sell_in).to eq(10)
            end
          end
        end

        context 'when quality above 50' do
          let(:quality) { 51 }

          it 'never changes quality' do
            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(51)
              expect(item.sell_in).to eq(10)
            end
          end
        end
      end

      context 'when sell in is 20' do
        let(:sell_in) { 20 }

        it 'never changes' do
          aggregate_failures 'testing item properties' do
            expect(item.quality).to eq(10)
            expect(item.sell_in).to eq(20)
          end
        end

        context 'when quality below zero' do
          let(:quality) { -1 }

          it 'never changes' do
            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(-1)
              expect(item.sell_in).to eq(20)
            end
          end
        end

        context 'when quality above 50' do
          let(:quality) { 51 }

          it 'never changes' do
            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(51)
              expect(item.sell_in).to eq(20)
            end
          end
        end
      end
    end

    context "when Aged Brie" do
      let(:name) { 'Aged Brie' }

      context 'when sell in below zero' do
        let(:sell_in) { -1 }

        it 'lowers sell_in but ups quality' do
          aggregate_failures 'testing item properties' do
            expect(item.quality).to eq(12)
            expect(item.sell_in).to eq(-2)
          end
        end

        context 'when quality below zero' do
          let(:quality) { -1 }

          it 'lowers sell_in but ups quality' do
            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(1)
              expect(item.sell_in).to eq(-2)
            end
          end
        end

        context 'when quality above 50' do
          let(:quality) { 51 }

          it 'lowers sell_in but ups quality' do
            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(51)
              expect(item.sell_in).to eq(-2)
            end
          end
        end
      end

      context 'when sell in is 5' do
        let(:sell_in) { 5 }

        it 'lowers sell_in but ups quality' do
          aggregate_failures 'testing item properties' do
            expect(item.quality).to eq(11)
            expect(item.sell_in).to eq(4)
          end
        end

        context 'when quality below zero' do
          let(:quality) { -1 }

          it 'lowers sell_in but ups quality' do
            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(0)
              expect(item.sell_in).to eq(4)
            end
          end
        end

        context 'when quality above 50' do
          let(:quality) { 51 }

          it 'lowers sell_in but ups quality' do
            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(51)
              expect(item.sell_in).to eq(4)
            end
          end
        end
      end

      context 'when sell in is 10' do
        let(:sell_in) { 10 }

        it 'lowers sell_in but ups quality' do


          aggregate_failures 'testing item properties' do
            expect(item.quality).to eq(11)
            expect(item.sell_in).to eq(9)
          end
        end

        context 'when quality below zero' do
          let(:quality) { -1 }

          it 'lowers sell_in but ups quality' do


            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(0)
              expect(item.sell_in).to eq(9)
            end
          end
        end

        context 'when quality above 50' do
          let(:quality) { 51 }

          it 'lowers sell_in but ups quality' do


            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(51)
              expect(item.sell_in).to eq(9)
            end
          end
        end
      end

      context 'when sell in is 20' do
        let(:sell_in) { 20 }

        it 'never changes' do


          aggregate_failures 'testing item properties' do
            expect(item.quality).to eq(11)
            expect(item.sell_in).to eq(19)
          end
        end

        context 'when quality below zero' do
          let(:quality) { -1 }

          it 'lowers sell_in but ups quality' do


            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(0)
              expect(item.sell_in).to eq(19)
            end
          end
        end

        context 'when quality above 50' do
          let(:quality) { 51 }

          it 'lowers sell_in but ups quality' do


            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(51)
              expect(item.sell_in).to eq(19)
            end
          end
        end
      end
    end

    context "when Backstage passes to a TAFKAL80ETC concert" do
      let(:name) { 'Backstage passes to a TAFKAL80ETC concert' }

      context 'when sell in below zero' do
        let(:sell_in) { -1 }

        it 'nullify quality but decrease sell_in' do


          aggregate_failures 'testing item properties' do
            expect(item.quality).to eq(0)
            expect(item.sell_in).to eq(-2)
          end
        end

        context 'when quality below zero' do
          let(:quality) { -1 }

          it 'nullify quality but decrease sell_in' do


            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(0)
              expect(item.sell_in).to eq(-2)
            end
          end
        end

        context 'when quality above 50' do
          let(:quality) { 51 }

          it 'nullify quality but decrease sell_in' do


            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(0)
              expect(item.sell_in).to eq(-2)
            end
          end
        end
      end

      context 'when sell in is 5' do
        let(:sell_in) { 5 }

        it 'adds three points to quality but lowers sell in' do


          aggregate_failures 'testing item properties' do
            expect(item.quality).to eq(13)
            expect(item.sell_in).to eq(4)
          end
        end

        context 'when quality below zero' do
          let(:quality) { -1 }

          it 'adds three points to quality but lowers sell in' do


            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(2)
              expect(item.sell_in).to eq(4)
            end
          end
        end

        context 'when quality above 50' do
          let(:quality) { 51 }

          it 'does not changes quality but lowers sell in' do


            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(51)
              expect(item.sell_in).to eq(4)
            end
          end
        end
      end

      context 'when sell in is 10' do
        let(:sell_in) { 10 }

        it 'adds two points to quality but lowers sell_in' do


          aggregate_failures 'testing item properties' do
            expect(item.quality).to eq(12)
            expect(item.sell_in).to eq(9)
          end
        end

        context 'when quality below zero' do
          let(:quality) { -1 }

          it 'adds two points to quality but lowers sell_in' do


            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(1)
              expect(item.sell_in).to eq(9)
            end
          end
        end

        context 'when quality above 50' do
          let(:quality) { 51 }

          it 'does not changes quality but lowers sell in' do


            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(51)
              expect(item.sell_in).to eq(9)
            end
          end
        end
      end

      context 'when sell in is 20' do
        let(:sell_in) { 20 }

        it 'adds one point to quality but lowers sell_in' do


          aggregate_failures 'testing item properties' do
            expect(item.quality).to eq(11)
            expect(item.sell_in).to eq(19)
          end
        end

        context 'when quality below zero' do
          let(:quality) { -1 }

          it 'adds one point to quality but lowers sell_in' do


            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(0)
              expect(item.sell_in).to eq(19)
            end
          end
        end

        context 'when quality above 50' do
          let(:quality) { 51 }

          it 'does not change quality but lowers sell_in' do


            aggregate_failures 'testing item properties' do
              expect(item.quality).to eq(51)
              expect(item.sell_in).to eq(19)
            end
          end
        end
      end
    end
  end
end
