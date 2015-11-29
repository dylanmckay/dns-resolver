require_relative 'util'

class Query
  attr_reader :ip_address, :type, :class

  def initialize(ip_address, type, class)
    @ip_address = ip_address
    @type = type
    @class = class
  end

  def self.parse(bytes)
    ip_address = IpAddress.new(bytes[0...4])
    type = (bytes[4] << 8) | bytes[5]
    class = (bytes[6] << 8) | bytes[7]
    Query.new(ip_address, type, class)
  end
end
