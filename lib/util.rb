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
