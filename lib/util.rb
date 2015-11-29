def bool_to_bit(value)
  case value
  when true then 1
  when false then 0
  when 1 | 0 then value
  end
end

# An IP address
class IpAddress

  attr_reader :bytes

  def initialize(bytes)
    @bytes = bytes
  end
end

def concatenate_bytes(array)
  return 0 if array.empty?
  
  shift_amount = (array.length * 8) - 8

  array.each.inject(0) do |result, byte|
    result |= (byte << shift_amount)
    shift_amount -= 8
    result
  end
end
