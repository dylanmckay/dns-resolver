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

def concatenate_bits(bits)
  bits.each.with_index.inject(0) do |result,bit_and_index|
    bit = bit_and_index[0]
    index = bit_and_index[1]

    shift_amount = bits.length - index - 1
    result | (bit << shift_amount)
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

def get_bit_from_byte(byte, position)
  masked_out = byte & (1 << position)
  masked_out >> position
end

def bit_array(bytes)
  bytes.map { |byte| byte_to_bits(byte) }.flatten
end

def byte_to_bits(byte)
  (0...8).each.inject([]) do |bits, n|
    bit = get_bit_from_byte(byte, n)
    [bit] + bits
  end
end

def value_to_bytes(value)
  position = 0
  result = []

  if value == 0
    return [0]
  end

  while value != 0
    mask = 0xff << position

    masked_value = value & mask
    separated_value = masked_value >> position
    result << separated_value

    value &= ~masked_value

    position += 8
  end

  result.reverse
end
