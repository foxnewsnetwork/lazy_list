module LazyList
  class Stream < Base

    class << self
      def cycle(a)
        new.prepend(a).recur { |a| a }
      end
    end

    def prepend(a)
      @has_contents = true
      f = lambda { a }
      @list = LazyList.cons f, @list
      self
    end

    def inspect
      "[" + take(5).map(&:inspect).join(", ") + "...]"
    end

    def first
      LazyList.car(@list).call.call
    end

    def rest
      self.class.new LazyList.cdr(@list).call.call
    end



    def recur(&block)
      @count = Float::INFINITY
      @list = _recur( first, &block )
      self
    end

    private

    def _recur(element, &block)
      f = lambda { element }
      l = lambda do
        _recur( yield(element), &block) 
      end
      LazyList.cons f,l
    end
  end
end