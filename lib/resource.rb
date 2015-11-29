require_relative 'util'

class Resource
  attr_reader :ip_address, :type, :class

  def initialize(ip_address, type, class, ttl)
    @ip_address = ip_address
    @type = type
    @class = class
    @ttl = ttl
  end

  def self.parse(bytes)
    ip_address = IpAddress.new(bytes[0...4])
    type = concatenate_bytes(bytes[4...5])
    class = concatenate_bytes(bytes[6...7])
    ttl = concatenate_bytes(bytes[8...11])
    Resource.new(ip_address, type, class, ttl)
  end
end
