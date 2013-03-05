Lazy List for Ruby
=
SICP-friendly version of the notorious lazy list for Ruby2.0.0.

One of the most badass things about Ruby2.0 is the Enumerator::Lazy,
but using that guy on a regular boring Array is kind of a waste as it
doesn't make it lazy enough. Thus lazy_list for ruby.

# IMPORTANT!!
=
Requires Ruby2.0 to work!

Actually, that's not necessarily true. It requires Enurmerator::Lazy to work


Examples
=
1. Generic FizzBuzz (where divisble by 3 -> fizz, divisble by 5 -> buzz, divisible by 15 -> fizzbuzz) example
```ruby
  from_1 = LazyList::Stream.cycle(1).recur { |v| v + 1 } # [1, 2, 3, 4, 5...]
  fizzes = from_1.lazy.map { |v| (v%3).zero? "fizz" : nil }
  buzzes = from_1.lazy.map { |v| (v%5).zero? "buzz" : nil }
  solution = from_1.lazy.zip(fizzes.zip buzzes).map { |v| [v.first, "#{v.last.first}#{v.last.last}"] }.take(100).to_a
```

2. More examples coming up!

Contributing to lazy_list
= 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
=
Copyright (c) 2013 Thomas Chen. See LICENSE.txt for
further details.

