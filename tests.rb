require_relative 'main.rb'

puts '1.--------my_each--------'
%w[Sharon Leo Leila Brian Arun].my_each { |friend| puts friend }
%w[Sharon Leo Leila Brian Arun].each { |friend| puts friend }

p %w[Sharon Leo Leila Brian Arun].my_each
p %w[Sharon Leo Leila Brian Arun].each
p (1..3).each { |friend| puts friend }
p (1..3).my_each { |friend| puts friend }

puts '2.--------my_each_with_index--------'
%w[Sharon Leo Leila Brian Arun].my_each_with_index { |friend, index| print "#{friend} #{index} \n" }
%w[Sharon Leo Leila Brian Arun].each_with_index { |friend, index| print "#{friend} #{index} \n" }
p (1..3).each_with_index { |friend| puts friend }
p (1..3).my_each_with_index { |friend| puts friend }

puts '3.--------my_select--------'
NEW_ARR = (%w[Sharon Leo Leila Brian Arun].my_select { |friend| friend != 'Brian' })
puts NEW_ARR

puts '4.--------my_all--------'
puts(%w[Sharon Leo Leila Brian Arun].my_all? { |word| word.length >= 3} == %w[Sharon Leo Leila Brian Arun].all? { |word| word.length >= 3})
puts(%w[ant bear cat].my_all?(/t/) == %w[ant bear cat].my_all?(/t/))
puts([1,2,3].my_all?(Float) == [1,2,3].all?(Float))
puts("4. #{[nil, true, 99].my_all? == [nil, true, 99].all?}")
puts("5. #{[].my_all? == [].all?}")
puts("6. #{[true, true, true].my_all? == [true, true, true].all?}")
puts("7. #{[false, false, false].my_all? == [false, false, false].all?}")
puts("8. #{[true, [true], true].my_all? == [true, [true], true].all?}")
puts("9. #{[1,-2,3.4].all?(Numeric) == [1,-2,3.4].my_all?(Numeric)}")
puts("10. #{['word',1,2,3].all?(Integer) == ['word',1,2,3].my_all?(Integer)}")
puts("11. #{['cat' 'cat'].my_all?(/t/) == ['cat' 'cat'].my_all?(/t/)}")
puts("12. #{['cat' 'cat'].my_all?(/a/) == ['cat' 'cat'].my_all?(/a/)}")
puts("13. #{[5,5,5].all?(5) == [5,5,5].my_all?(5)}")
puts("14. #{[5,[5],5].all?(5) == [5,[5],5].my_all?(5)}")

puts '5.--------my_any--------'
puts([1,2,3].any?(&proc{|x| x%2==0}) == [1,2,3].my_any?(&proc{|x| x%2==0}))
puts([1,2,3].any?(&proc{|x| x==0}) == [1,2,3].my_any?(&proc{|x| x==0}))
puts((1..3).any?(&proc{|x| x==0}) == (1..3).my_any?(&proc{|x| x==0}))
puts([false, 0].any? == [false, 0].my_any?)
puts([1.1,'',[]].any?(Numeric) == [1.1,'',[]].my_any?(Numeric))
puts([1,'',[]].any?(Numeric) == [1,'',[]].my_any?(Integer))
puts(['dog', 'cat'].any?(/d/) == ['dog', 'cat'].my_any?(/d/))
puts(['dog', 'cat'].any?(/z/) == ['dog', 'cat'].my_any?(/z/))
puts(['dog','car'].any?('cat') == ['dog','car'].my_any?('cat'))
puts(['cat', 'dog','car'].any?('cat') == ['cat', 'dog','car'].my_any?('cat'))

puts '6.--------my_none?--------'
puts((1..3).none?(&proc{|num| num%2==0}) == (1..3).my_none?(&proc{|num| num%2==0}))
puts([false, nil,[]].none? == [false, nil,[]].my_none?)
puts([true,[]].none?(String) == [true,[]].my_none?(String))
puts([true,[]].none?(Numeric) == [true,[]].my_none?(Numeric))
puts(['',[]].none?(String) == ['',[]].my_none?(String))
puts(['dog','cat'].none?(/x/) == ['dog','cat'].my_none?(/x/))
puts(['dog', 'cat'].none?(/d/) == ['dog', 'cat'].my_none?(/d/))
puts(['dog','car'].none?(5) == ['dog','car'].my_none?(5))
puts([5,'dog','car'].none?(5) == [5,'dog','car'].my_none?(5))

puts '7.--------my_count--------'
arr = [1, 2, 4, 2]
puts arr.my_count #=> 4
puts arr.my_count(2) #=> 2
puts arr.my_count(2) { |x| (x % 2).zero? } #=> 3
puts [nil, nil, nil, 2, 4].count(nil)
puts [nil, nil, nil, 2, 4].my_count(nil)
puts (1..3).count == (1..3).my_count

puts '8.--------my_inject--------'
puts([1, 2, 3, 4, 5, 6, 7, 8, 9].my_inject { |sum, n| sum + n })
puts([1, 2, 3, 4, 5, 6, 7, 8, 9].inject { |sum, n| sum + n })
puts([2, 4, 5].multiply_els)

puts '9.--------my_map--------'
r = [1, 2, 3]
print(r.map { |i| i * i })
print "\n"
print(r.my_map { |i| i * i })
print "\n"
puts (1..3).map(&proc{|num| num+1}) == (1..3).my_map(&proc{|num| num+1})
puts [1,2,3].map.class==[1,2,3].my_map.class

puts '10.--------my_map_proc--------'
print([1, 2, 7, 4, 5].my_map { |x| x * x })
print "\n"
puts [1,2,3].my_map(proc{|x|x%2}){|a|a*2} == [1,2,3].my_map(proc{|x|x%2})
