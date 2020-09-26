# rubocop:disable Metrics/ModuleLength, Metrics/MethodLength, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, Metrics/BlockNesting, Style/IfInsideElse, Metrics/AbcSize

module Enumerable
  # 1.my
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
    my = to_a
    while index < my.length
      if block_given?
        return false if yield(my[index]) == false
      else
        if argument.nil? # when there is no argument
          return false if my[index].nil? || my[index] == false
        elsif argument.class == Regexp # when there is an argument
          return false if my[index].match?(argument) != true
        elsif argument.class == Class
          return false if my[index].is_a?(argument) != true
        else # when the argument is no regexp ni class
          return false if my[index] != argument
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
    my = to_a
    if block_given?
      while a < my.length
        if yield(my[a]) == true
          o = true
          break
        end
        a += 1
      end
      o
    elsif arg.nil?
      while a < my.length
        if my[a] != false && !my[a].nil?
          o = true
          break
        elsif my[a].nil?
          o = false
        end
        a += 1
      end
      o
    elsif !arg.nil? && arg.class == Class
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
        if !my[a].match(arg).nil?
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
    elsif arg.class == Array
      p 'aaa'
    else
      true
    end
  end

  def my_none?(arg = nil)
    my = to_a
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
    elsif arg.nil?
      while a < my.length
        o = true
        if my[a] == true || my[a] == []
          o = false
          break
        end
        a += 1
      end
      o
    elsif !arg.nil? && arg.class != Regexp && arg.class != Integer
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
        if !my[a].match(arg).nil?
          o = false
          break
        else
          o = true
        end
        a += 1
      end
      o
    elsif arg.class != Regexp && !arg.nil?
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
  def my_inject(arg = nil, arg1 = nil)
    my = to_a
    sum = my[0]
    a = 1
    if arg.nil? && arg1.nil?
      while a < my.length
        sum = yield(sum, my[a])
        a += 1
      end
      sum
    elsif arg.class == Integer && arg1.nil?
      sum = yield(sum, arg)
      while a < my.length
        sum = yield(sum, my[a])
        a += 1
      end
      sum
    elsif arg.class == Symbol
      arg2 = arg.to_s
      while a < my.length
        sum = sum.method(arg2).call(my[a])
        a += 1
      end
      sum
    elsif arg.class == Integer && arg1.class == Symbol
      arg2 = arg1.to_s
      sum = sum.method(arg2).call(arg)
      while a < my.length
        sum = sum.method(arg2).call(my[a])
        a += 1
      end
      sum
    end
  end

  # 9.my_map
  def my_map(proc = nil)
    return to_enum unless block_given? || proc

    arr = []
    if proc
      my_each { |item| arr << proc.call(item) }
    else
      my_each { |item| arr << yield(item) }
    end
    arr
  end
end

def multiply_els(arg)
  arg.my_inject { |sum, n| sum * n }
end

# rubocop:enable Metrics/ModuleLength, Metrics/MethodLength, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, Metrics/BlockNesting, Style/IfInsideElse, Metrics/AbcSize
