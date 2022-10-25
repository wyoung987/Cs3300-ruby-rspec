# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  arr.sum
end

def max_2_sum arr
  # conditional statement determining which case of summing should happen
  if (arr.length() == 0)
    return 0
  elsif  (arr.length() == 1)
    # return the single number from the array
    return arr.max()
  else
    # find largest and delete largest
    largest = arr.max()
    arr.delete_at(arr.find_index(largest))
    # find second largest and delete that from the array
    secondLargest = arr.max()
    arr.delete_at(arr.find_index(secondLargest))
    # sum both the numbers and return it
    total = largest + secondLargest
    return total
  end  

end

def sum_to_n? arr, n
  #define bool sum
  sum = false

  # conditional testing for empty array
  if(arr.length() == 0)
    return false
  elsif(arr.length() == 1)
    return false
  else
    # double for loop adding up all combinations seeing if one comes out correctly
    for i in 0..arr.length()-1
      j = i+1
      for j in j..arr.length()-1
        if(arr[i]+arr[j] == n)
          sum = true
        end
      end      
    end
  end

  return sum
end

# Part 2

def hello(name)

  returnString = ("Hello, ")
  # Concatenate return string with name
  retrunString = returnString + name
end

def starts_with_consonant? s
  #declare bool
  startsWConsonant = false

  #test with conditional
  if(s.match?(/^[bcdfgjklmnpqstvxzhrwyBDCFGJKLMNPQSTVXZHRWY]/))
    startsWConsonant = true
  end
end

def binary_multiple_of_4? s

  #check to see if the string is empty
  if(s.length() == 0)
    return false
  end

  # if the string is not empty convert s to bytes and compare each digit to make sure it is binary
  arr = s.bytes
  for i in arr
    if(i != 48 && i != 49)
      return false
    end
  end

  # since the string is not empty and a binary number, check if it is a multiple of 4
  binToDec = s.to_i
  if(binToDec.modulo(4) == 0)
    return true
  else
    return false
  end 
end

# Part 3

class BookInStock

  # constructor for book class with isbn and price
  def initialize(isbn, price)

    # raise argument error if isbn is empty or price <= 0
    if(isbn.class == String && (price.class == Float || price.class == Integer))
      if(isbn.length() != 0 && price > 0)
        @isbn = isbn
        @price = price
      else
        raise ArgumentError
      end
    else
      raise ArgumentError
    end

  end

  # getter for isbn
  def isbn
    @isbn
  end
  # setter for isbn
  def isbn=(isbn)
    # raise same errors as constructor
    raise ArgumentError if(isbn.class != String)
    raise ArgumentError if(isbn.length() == 0)
    @isbn = isbn
  end

  #getter for price
  def price
    @price
  end
  #setter for price
  def price=(price)
    # raise same errors as constructor
    raise ArgumentError if(price.class != Float)
    raise ArgumentError if(price <= 0)
    @price = price
  end

  def price_as_string
    # return as a string with 2 decimal places. % means substitute .2f for price 
    return "$%.2f" % [@price]
  end

end
