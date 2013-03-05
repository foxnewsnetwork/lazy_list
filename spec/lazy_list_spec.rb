require "spec_helper"

describe LazyList do
  let(:api) { LazyList }
  context "null usage" do
    let(:list) { api.cons }

    describe "::car" do
      let(:nothing) { api.car( list).call }

      it "give me nothing" do
        nothing.should be_nil
      end
    end
    describe "::cdr" do
      let(:nothing) { api.cdr( list ).call }

      it "should also be nothing" do
        nothing.should be_nil
      end
    end
  end

  context "singleton usage" do
    let(:list) { api.cons 1 }

    describe "::car" do
      let(:one) { api.car( list).call }

      it "should give the first and only value in the singleton list" do
        one.should eq 1
      end
    end
    describe "::cdr" do
      let(:nothing) { api.cdr( list).call }

      it "should give me nothing" do
        nothing.should be_nil
      end
    end
  end

  describe "::cons" do
    let(:list) { api.cons 1, 2 }

    it "should actually be a lambda" do
      list.should be_a Proc
    end

    describe "::car" do
      let(:one) { api.car(list).call }
      it "should return the first element of the list" do
        one.should eq 1
      end
    end

    describe "::cdr" do
      let(:two) { api.cdr( list).call }

      it "should return the remaining elements of the list" do
        two.should eq 2
      end
    end

    context "chaining" do
      let(:list2) { api.cons 0, list }

      it "should still be a proc" do
        list2.should be_a Proc
      end

      describe "::car" do
        let(:zero) { api.car( list2).call }
        it "should get the first element of the new list" do
          zero.should eq 0
        end
      end

      describe "::cdr" do
        let(:one) { api.cdr( list2).call }
        it "should fetch the rest of the list" do
          one.should eq list
          api.car(one).call.should eq 1
        end
        describe "::cdr" do
          let(:two) { api.cdr( one).call }
          it "should fetch out the final element in the lazy list" do
            two.should eq 2
          end
        end
      end
    end
  end

end