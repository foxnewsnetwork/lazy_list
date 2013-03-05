require "spec_helper"

describe LazyList::Base do
  let(:list) { LazyList::Base.new }

  describe "#prepend" do
    before :each do
      list.prepend(1).prepend(2).prepend(3)
    end

    describe "#inspect" do
      it "should return to me a reasonable string" do
        list.inspect.should eq "[3, 2, 1]"
      end
    end

    describe "#rest" do
      it "should return to me another list that is different from the first list only by the head" do
        list.rest.should be_a LazyList::Base
        list.rest.should_not be_empty
      end
      it "should always return a LazyList::Base even if empty" do
        list.rest.rest.rest.should be_a LazyList::Base
      end
    end

    it "should get me a list of stuff" do
      list.first.should eq 3
      list.rest.first.should eq 2
      list.rest.rest.first.should eq 1
    end
  end

  
end