# rubocop:disable Metrics/ModuleLength, Style/GuardClause

module Enumerable
  # 1.my_each
  def my_each
    # return to_enum(:my_each) unless block_given?
    if block_given?
      a = 0
      while a < length
        yield self[a]
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
      while a < length
        yield(self[a], a)
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
      my_each { |item| new_arr << item if yield(item) }
      new_arr
    end
  end

  # 4.my_all?
  def my_all?
    if block_given?
      a = 0
      o = true
      while a < length
        if yield(self[a]) == false
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

  # 4.my_any?
  def my_any?
    if block_given?
      yield(self)
    else
      true
    end
  end

  def my_none?
    if block_given?
      a = 0
      while a < length
        if yield(self[a]) == true
          o = false
          break
        else
          a += 1
          o = true
        end
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
  def my_map
    a = 0
    arr1 = []
    while a < length
      sum = yield(self[a])
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
