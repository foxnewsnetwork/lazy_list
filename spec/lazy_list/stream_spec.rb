require 'spec_helper'

describe LazyList::Stream do 
  let(:api) { LazyList::Stream }
  context "infinite streams" do
    describe "::cycle" do
      let(:stream) { api.cycle 1 }

      describe "#recur" do
        let(:infinite) { stream.recur { |v| v + 1 }.lazy }

        context "enumerable" do

          describe "#take" do
            let(:ten) { infinite.take(10).to_a }
            it "should be a finite array of 10 things" do
              stream.take(10).should eq [1,1,1,1,1,1,1,1,1,1]
              ten.should eq [1,2,3,4,5,6,7,8,9,10]
            end
          end

          describe "#reject" do
            let(:odds) { infinite.reject { |v| (v%2).zero? }.take(100).to_a }
            it "should only have the odd numbers" do
              odds.count.should eq 100
              odds.each { |o| (0%2).should eq 0 }
            end
          end

          describe "#map" do
            let(:scaled) { infinite.map { |v| v * 2 }.take(5).to_a }

            it "should give me a scaled version of the input array" do
              scaled.should eq [2,4,6,8,10]
            end
          end

          describe "#to_s" do
            let(:string) { stream.inspect }

            it "should give me a reasonable string" do
              string.should eq "[1, 1, 1, 1, 1...]"
            end
          end
        end
      end
    end
    describe "#prepend" do
      let(:stream) { api.new.prepend(2) }

      describe "#recur" do
        let(:infinite) { stream.recur { |value| value * 2 } }

        describe "#first" do
          let(:two) { infinite.first }
          let(:four) { infinite.rest.first }
          let(:eight) { infinite.rest.rest.first }
          let(:sixteen) { infinite.rest.rest.rest.first }
          it "should get me the correct values" do
            two.should eq 2
            four.should eq 4
            eight.should eq 8
            sixteen.should eq 16
          end
        end

      end
    end
  end
end