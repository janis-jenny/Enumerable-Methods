# rubocop:disable Layout/LineLength
require_relative 'main.rb'

puts '1.--------my_each--------'
%w[Sharon Leo Leila Brian Arun].my_each { |friend| puts friend }
%w[Sharon Leo Leila Brian Arun].each { |friend| puts friend }

p %w[Sharon Leo Leila Brian Arun].my_each
p %w[Sharon Leo Leila Brian Arun].each
p(1..3).each { |friend| puts friend }
p(1..3).my_each { |friend| puts friend }

puts '2.--------my_each_with_index--------'
%w[Sharon Leo Leila Brian Arun].my_each_with_index { |friend, index| print "#{friend} #{index} \n" }
%w[Sharon Leo Leila Brian Arun].each_with_index { |friend, index| print "#{friend} #{index} \n" }
p(1..3).each { |friend| puts friend }
p(1..3).my_each_with_index { |friend| puts friend }

puts '3.--------my_select--------'
NEW_ARR = (%w[Sharon Leo Leila Brian Arun].my_select { |friend| friend != 'Brian' })
puts NEW_ARR

puts '4.--------my_all--------'
puts(%w[Sharon Leo Leila Brian Arun].my_all? { |word| word.length >= 3 } == %w[Sharon Leo Leila Brian Arun].all? { |word| word.length >= 3 })
puts(%w[ant bear cat].my_all?(/t/) == %w[ant bear cat].all?(/t/))
puts([1, 2, 3].my_all?(Float) == [1, 2, 3].all?(Float))
puts("4. #{[nil, true, 99].my_all? == [nil, true, 99].all?}")
puts("5. #{[].my_all? == [].all?}")
puts("6. #{[true, true, true].my_all? == [true, true, true].all?}")
puts("7. #{[false, false, false].my_all? == [false, false, false].all?}")
puts("8. #{[true, [true], true].my_all? == [true, [true], true].all?}")
puts("9. #{[1, -2, 3.4].all?(Numeric) == [1, -2, 3.4].my_all?(Numeric)}")
puts("10. #{['word', 1, 2, 3].all?(Integer) == ['word', 1, 2, 3].my_all?(Integer)}")
puts("11. #{%w[cat cat].my_all?(/t/) == %w[cat cat].all?(/t/)}")
puts("12. #{%w[cat cat].my_all?(/a/) == %w[cat cat].all?(/a/)}")
puts("13. #{[5, 5, 5].all?(5) == [5, 5, 5].my_all?(5)}")
puts("14. #{[5, [5], 5].all?(5) == [5, [5], 5].my_all?(5)}")
range = Range.new(5, 50)
HIGHEST_VALUE = range.max
block = proc { |num| num > HIGHEST_VALUE }
puts range.my_all?(&block)

puts '5.--------my_any--------'
puts([1, 2, 3].any?(&proc { |x| x.even? }) == [1, 2, 3].my_any?(&proc { |x| x.even? }))
puts([1, 2, 3].any?(&proc { |x| x.zero? }) == [1, 2, 3].my_any?(&proc { |x| x.zero? }))
puts((1..3).any?(&proc { |x| x.zero? }) == (1..3).my_any?(&proc { |x| x.zero? }))
puts([false, 0].any?)
puts([false, 0].my_any?)
puts([1.1, '', []].any?(Numeric) == [1.1, '', []].my_any?(Numeric))
puts([1, '', []].any?(Integer) == [1, '', []].my_any?(Integer))
puts(%w[dog cat].any?(/d/) == %w[dog cat].my_any?(/d/))
puts(%w[dog cat].any?(/z/) == %w[dog cat].my_any?(/z/))
puts(%w[dog car].any?('cat') == %w[dog car].my_any?('cat'))
puts(%w[cat dog car].any?('cat') == %w[cat dog car].my_any?('cat'))
array = [nil, false]
puts(array.my_any? == array.any?)
words = %w[dog door rod blade]
puts(words.my_any?(Integer) == words.any?(Integer))
puts([nil, false, true, []].my_any?)
puts([nil, false, true, []].any?)

puts '6.--------my_none?--------'
puts((1..3).none?(&proc { |num| num.even? }) == (1..3).my_none?(&proc { |num| num.even? }))
puts([false, nil, []].none? == [false, nil, []].my_none?)
puts([true, []].none?(String) == [true, []].my_none?(String))
puts([true, []].none?(Numeric) == [true, []].my_none?(Numeric))
puts(['', []].none?(String) == ['', []].my_none?(String))
puts(%w[dog cat].none?(/x/) == %w[dog cat].my_none?(/x/))
puts(%w[dog cat].none?(/d/) == %w[dog cat].my_none?(/d/))
puts(%w[dog car].none?(5) == %w[dog car].my_none?(5))
puts([5, 'dog', 'car'].none?(5) == [5, 'dog', 'car'].my_none?(5))
array = [nil, false]
puts(array.my_none? == array.none?)
array = [nil, false, true, []]
puts(array.my_none? == array.none?)

puts '7.--------my_count--------'
arr = [1, 2, 4, 2]
puts arr.my_count #=> 4
puts arr.my_count(2) #=> 2
puts arr.my_count(2) { |x| (x % 2).zero? } #=> 3
puts [nil, nil, nil, 2, 4].count(nil)
puts [nil, nil, nil, 2, 4].my_count(nil)
puts((1..3).count == (1..3).my_count)

puts '8.--------my_inject--------'
puts([1, 2, 3, 4, 5, 6, 7, 8, 9].my_inject { |sum, n| sum + n })
puts([1, 2, 3, 4, 5, 6, 7, 8, 9].inject { |sum, n| sum + n })
puts((1..3).inject(&proc { |total, num| total * num }) == (1..3).my_inject(&proc { |total, num| total * num }))
puts((1..3).inject(4) { |prod, n| prod * n } == (1..3).my_inject(4) { |prod, n| prod * n })
puts([1, 2, 3].inject(:+) == [1, 2, 3].my_inject(:+))
puts((1..9).inject(:+) == (1..9).my_inject(:+))
puts((1..3).inject(4, :*) == (1..3).my_inject(4, :*))
puts(multiply_els([1, 2, 3]) == 6)

puts '9.--------my_map--------'
r = [1, 2, 3]
print(r.map { |i| i * i })
print "\n"
print(r.my_map { |i| i * i })
print "\n"
print([1, 2, 7, 4, 5].my_map { |x| x * x })
print "\n"
puts [1, 2, 3].my_map(proc { |x| x % 2 }) { |a| a * 2 } == [1, 2, 3].my_map(proc { |x| x % 2 })
puts((1..3).map(&proc { |num| num + 1 }) == (1..3).my_map(&proc { |num| num + 1 }))
puts [1, 2, 3].map.class == [1, 2, 3].my_map.class
puts [1, 2, 3].my_map(proc { |x| x % 2 }) { |a| a * 2 } == [1, 2, 3].my_map(proc { |x| x % 2 })

# rubocop:enable Layout/LineLength
