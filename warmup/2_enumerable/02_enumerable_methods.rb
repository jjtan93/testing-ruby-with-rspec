module Enumerable
  
  def my_each
    if !block_given?
      return self
    else
      for i in self
        yield(i)
      end
    end
  end
  
  def my_each_with_index
    if !block_given?
      return self
    else
      for i in 0..self.length - 1
        yield(self[i], i)
      end
    end
  end
  
  def my_select
    arrayToReturn = []
    
    if !block_given?
      return self
    else
      my_each{|i| arrayToReturn << i if(yield(i))}
    end
    
    arrayToReturn
  end
  
  def my_all?
    if !block_given?
      my_each{|i| return false if( !i || i == nil)}
    else
      my_each{|i| return false if( !yield(i) )}
    end
    
    return true
  end
  
  def my_any?
    if !block_given?
      my_each{|i| return true if(i || i != nil)}
    else
      my_each{|i| return true if(yield(i))}
    end
    
    return false
  end
  
  def my_none?
    if !block_given?
      my_each{|i| return false if(i)}
    else
      my_each{|i| return false if(yield(i))}
    end
    
    return true
  end
  
  def my_count(itemArg = 'noitemgiven')
    count = 0
    
    if block_given?
      my_each{|i| count += 1 if(yield(i))}
    elsif(itemArg != 'noitemgiven')
      my_each{|i| count += 1 if(i == itemArg)}
    else
      my_each{|i| count += 1 }
    end
    
    return count
  end
  
  def my_map
    resultArray = []
    
    if !block_given?
      #TODO
    else
      my_each{|i| resultArray << yield(i)}
    end
    
    return resultArray
  end
  
  def my_inject(initialArg = 0)
    total = yield(initialArg, self[0])
    
    for i in (1..(self.length - 1) )
      total = yield(total, self[i])
    end
    
    return total
  end
  
  def my_map_proc(proc)
    resultArray = []
    
    my_each{|i| resultArray << proc.call(i)}
    
    return resultArray
  end
    
  def my_map_proc_or_block(proc = nil)
    resultArray = []
    
    if(proc != nil)
      my_each{|i| resultArray << proc.call(i)}
    elsif(block_given?)
      my_each{|i| resultArray << yield(i)}
    else
      #TODO
    end
    
    return resultArray
  end
  
end

=begin
arr = ["a", 'b', 'c']
puts arr.my_each_with_index do |element, index|
   element + " " + index.to_s
end

result = ['ar', 'b', 'array'].my_select do |element|
  element[0..1] == 'ar'
end
puts result
=end

#puts %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
#puts %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false

=begin
puts ary = [1, 2, 4, 2]
puts ary.my_count               #=> 4
puts ary.my_count(2)            #=> 2
puts ary.my_count{ |x| x%2==0 } #=> 3
=end

=begin
puts %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
puts %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
puts [nil, true, 99].my_any?                              #=> true
=end

#puts %w{ant bear cat}.my_none? { |word| word.length == 5 } #=> true
#puts %w{ant bear cat}.my_none? { |word| word.length >= 4 } #=> false

#puts (1..4).my_map { |i| i*i }      #=> [1, 4, 9, 16]

arr = (5..10).to_a
puts arr.my_inject { |sum, n| sum + n } 
puts (5..10).inject(1) { |product, n| product * n } 

=begin
aProc = Proc.new {|i| i*i}
puts (1..4).my_map_proc(aProc)    #=> [1, 4, 9, 16]
=end
    
aProc = Proc.new {|i| i*i}
puts (1..4).my_map_proc_or_block(aProc){|i| i*2}    #=> [1, 4, 9, 16]
puts (1..4).my_map_proc_or_block(){|i| i*2}    #=> [2, 4, 6, 8]