module LazyList
  class Base
    include Enumerable

    def initialize(list=nil)
      @list = list
      @list ||= LazyList.cons
    end

    def empty?
      @has_contents ||= false
    end

    def inspect
      "[" + (map { |element| element.inspect }.join(", ")) + "]"
    end

    def prepend(a)
      @has_contents = true
      @list = LazyList.cons a, @list
      self
    end

    def first
      LazyList.car(@list).call
    end

    def rest
      self.class.new LazyList.cdr(@list).call
    end

    def each(&block)
      return if first.nil?
      yield first
      rest.each(&block)
    end

  end
end