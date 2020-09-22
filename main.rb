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
      yield(self)
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
end
