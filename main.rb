# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

module Enumerable
# 1.my_each
  def my_each
    #return to_enum(:my_each) unless block_given?
    if block_given?
      a = 0
      while a < self.length
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
    #return to_enum(:my_each_index) unless block_given?
    if block_given?
      a = 0
      while a < self.length
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
    #return to_enum(:my_each_index) unless block_given?
    if block_given?
      newArr = []
      self.my_each {|item| newArr << item if yield(item)}
      newArr
    end
  end

  # 4.my_all?
  def my_all?
    if block_given?
      a = 0
      o = true
      while a < self.length
        if  yield(self[a]) == false
          o = false
          break
        end
        a += 1
      end
      return o
    else
      return true
    end
  end

  # 4.my_any?
  def my_any?
    if block_given?
      yield(self)
    else
      return true
    end
  end

  def my_none?
    if block_given?
      a = 0
      while a < self.length
        if yield(self[a]) == true
          o = false
          break
        else
          a += 1
          o = true
        end
      end
      return o
    else
      return true
    end
  end

  # 7.my_count
  def my_count (*value)
    count = 0
    if block_given?
      my_each {|item| count += 1 if yield(item)}
    elsif !value.empty? #when value are given or when the array is not empty
      my_each {|item| count += 1 if item == value[0]}
    else   #when there is no value but is nil and there is no block
      my_each {|item| count += 1}
    end
  count
  end

  # 8.my_inject
  def my_inject
    sum = self[0]
    a = 1 #?
    while a < self.length
      sum = yield(sum, self[0])
      a += 1
    end
    return sum
  end

  def multiply_els
    self.my_inject {|sum, n| sum * n}
  end

  def my_map
    a = 0
    arr1 = []
    while a < self.length
      sum = yield(self[a])
      arr1[a] = sum
      sum = 0
      a += 1
    end
    return arr1
  end

  def my_map_proc
    if block_given? || proc
     newArr = []
      if proc
        my_each { |item| newArr << proc.call(item) }
      else
        my_each { |item| newArr << yield(item) }
      end
      newArr
    end
  end

end

#arr = [1, 2, 4, 2] #test array
#puts arr.my_count #=> 4
#puts arr.my_count(2, 4, 1)
