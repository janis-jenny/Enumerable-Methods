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
end

