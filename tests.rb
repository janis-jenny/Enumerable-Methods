require_relative 'main.rb'

puts '1.--------my_each--------'
%w[Sharon Leo Leila Brian Arun].my_each { |friend| puts friend }
%w[Sharon Leo Leila Brian Arun].each { |friend| puts friend }

p %w[Sharon Leo Leila Brian Arun].my_each
p %w[Sharon Leo Leila Brian Arun].each

puts '2.--------my_each_with_index--------'
%w[Sharon Leo Leila Brian Arun].my_each_with_index { |friend, index| print "#{friend} #{index} \n"}
%w[Sharon Leo Leila Brian Arun].each_with_index { |friend, index| print "#{friend} #{index} \n" }

puts '3.--------my_select--------'
newArr = (%w[Sharon Leo Leila Brian Arun].my_select { |friend| friend != 'Brian' })
puts newArr

puts '4.--------my_all--------'
puts %w[Sharon Leo Leila Brian Arun].my_all? { |word| word.length >= 3 }
puts %w[Sharon Leo Leila Brian Arun].all? { |word| word.length >= 3 }

puts '5.--------my_any--------'
puts (%w[Sharon Leo Leila Brian Arun].my_any? { |word| word.length >= 3 }) #=> true
puts (%w[Sharon Leo Leila Brian Arun].my_any? { |word| word.length >= 4 }) #=> true

puts '6.--------my_none?--------'
puts %w{ant bear cat}.my_none? { |word| word.length == 5 }
puts %w{ant bear cat}.none? { |word| word.length == 5 }

puts '7.--------my_count--------'
arr = [1, 2, 4, 2]
puts arr.my_count #=> 4
puts arr.my_count(2) #=> 2
puts arr.my_count(2) { |x| (x % 2).zero? } #=> 3
puts [nil, nil, nil, 2, 4].count(nil)
puts [nil, nil, nil, 2, 4].my_count(nil)

puts '8.--------my_inject--------'
puts ([1, 2, 3, 4, 5, 6, 7, 8, 9].my_inject { |sum, n| sum + n } )
puts ([1, 2, 3, 4, 5, 6, 7, 8, 9].inject { |sum, n| sum + n } )
puts ([2,4,5].multiply_els)

puts '8.--------my_maps--------'
r = [1, 2, 3]
puts (r.map { |i| i * i } )
puts (r.my_map { |i| i * i })
