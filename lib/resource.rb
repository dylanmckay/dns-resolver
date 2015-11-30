require_relative 'util'

class Resource
  attr_reader :ip_address, :type, :class, :rdata

  def initialize(ip_address, type, class, ttl, rdata = nil)
    @ip_address = ip_address
    @type = type
    @class = class
    @ttl = ttl
    @rdata = rdata
  end

  def self.parse(bytes)
    ip_address = IpAddress.new(bytes[0...4])
    type = concatenate_bytes(bytes[4...5])
    class = concatenate_bytes(bytes[6...7])
    ttl = concatenate_bytes(bytes[8...11])

    rdata_length = concatenate_bytes(bytes[11...13])

    rdata = concatenate_bytes(bytes[13...13+rdata_length])

    Resource.new(ip_address, type, class, ttl, rdata)
  end
end
