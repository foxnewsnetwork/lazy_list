module LazyList
  autoload :Base, File.join(File.dirname(__FILE__), "lazy_list", "base")
  autoload :Stream, File.join(File.dirname(__FILE__), "lazy_list", "stream")
  class << self
    def cons(a=nil,b=nil)
      lambda { |c| c.call(a,b) }
    end

    def cdr(list)
      lambda { list.call( lambda { |a,b| b } ) }
    end

    def car(list)
      lambda { list.call( lambda { |a,b| a } ) }
    end
  end
end