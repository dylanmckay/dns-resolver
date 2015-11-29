require_relative 'util'

module Records

  # An 'A' record.
  #
  # Stores a 32-bit IP address
  class Address

    attr_reader :ip

    # Creates an Address from a 32-bit IP address
    def initialize(bytes)
      @ip = IpAddress.initialize(bytes)
    end
  end
end
