# rubocop:disable Metrics/ModuleLength, Style/GuardClause

module Enumerable
  # 1.my_each
  def my_each
    # return to_enum(:my_each) unless block_given?
    if block_given?
      a = 0
      while a < to_a.length
        yield to_a[a]
        a += 1
      end
      self
    else
      to_enum(:my_each)
    end
  end

  # 2.my_each_index
  def my_each_with_index
    # return to_enum(:my_each_index) unless block_given?
    if block_given?
      a = 0
      while a < to_a.length
        yield(to_a[a], a)
        a += 1
      end
      self
    else
      to_enum(:my_each_with_index)
    end
  end

  # 2.my_select
  def my_select
    # return to_enum(:my_each_index) unless block_given?
    if block_given?
      new_arr = []
      to_a.my_each { |item| new_arr << item if yield(item) }
      new_arr
    else
      to_enum(:my_each_with_index)
    end
  end

  # 4.my_all?
  def my_all?(argument = nil)
    index = 0
    while index < length
      if block_given?
      return false if yield(self[index]) == false
      else
        if argument === nil #when there is no argument
          return false if self[index].nil? || self[index] == false
        elsif argument.class == Regexp #when there is an argument
          return false if self[index].match?(argument) != true
        elsif argument.class == Class
          return false if self[index].is_a?(argument) != true
        else #when the argument is no regexp ni class
          return false if self[index] != argument
        end
      end
      index += 1
    end
    true
  end

  # 4.my_any?
  def my_any?(arg = nil)
    a = 0
    o = false
    my = self.to_a
    if block_given?
      while a < my.length
        if yield(my[a]) == true
          o = true
          break
        end
        a += 1
      end
      o
    elsif arg == nil
      o = true
      elsif block_given? == true && arg != nil
      o = false
      while a < my.length
        if (my[a].is_a? arg) == true
          o = true
          break
        end
        a += 1
      end
      o
    elsif arg.class == Regexp
      while a < my.length
        if (my[a].match(arg) != nil)
          o = true
          break
        else
          o = false
        end
        a += 1
      end
      o
    elsif arg.class != Regexp && arg.class == String
      while a < my.length
        if my[a] == arg
          o = true
          break
        else
          o = false
        end
        a += 1
      end
      o
    else
      true
    end
  end

  def my_none?(arg = nil)
    my = self.to_a
    a = 0
    if block_given?
      while a < my.length
        if yield(my[a]) == true
          o = false
          break
        else
          a += 1
          o = true
        end
      end
      o
    elsif arg == nil
      while a < my.length
        if my[a] == true
          o = true
          break
        else
          o = false
        end
        a += 1
      end
      o
    elsif arg != nil && arg.class != Regexp && arg.class != Integer
      o = true
      while a < my.length
        if (my[a].is_a? arg) == true
          o = false
          break
        end
        a += 1
      end
      o
    elsif arg.class == Regexp
      while a < my.length
        if my[a].match(arg) != nil
          o = false
          break
        else
          o = true
        end
        a += 1
      end
      o
    elsif arg.class != Regexp && arg != nil
      o = true
      while a < my.length
        if my[a] == arg
          o = false
          break
        end
        a += 1
      end
      o
    else
      true
    end
  end

  # 7.my_count
  def my_count(*value)
    count = 0
    if block_given?
      my_each { |item| count += 1 if yield(item) }
    elsif !value.empty? # when value are given or when the array is not empty
      my_each { |item| count += 1 if item == value[0] }
    else # when there is no value but is nil and there is no block
      my_each { |_item| count += 1 }
    end
    count
  end

  # 8.my_inject
  def my_inject
    sum = self[0]
    a = 1
    while a < length
      sum = yield(sum, self[a])
      a += 1
    end
    sum
  end

  def multiply_els
    my_inject { |sum, n| sum * n }
  end

  # 9.my_map
  def my_map(argument=nil)
    a = 0
    arr1 = []
    while a < to_a.length
      sum = yield(to_a[a])
      arr1[a] = sum
      sum = 0
      a += 1
    end
    arr1
  end

  # 10.my_map_proc
  def my_map_proc
    if block_given? || proc
      new_arr = []
      if proc
        my_each { |item| new_arr << proc.call(item) }
      else
        my_each { |item| new_arr << yield(item) }
      end
      new_arr
    end
  end
end

# rubocop:enable Metrics/ModuleLength, Style/GuardClause
