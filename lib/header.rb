
require_relative 'util'

# A raw DNS packet

module Packet

  class Header

    attr_accessor :id, :query_response_flag, :opcode, :response_code, :flags

    def initialize
      @id = 0
      @query_response_flag = 0
      @opcode = 0
      @response_code = 0

      @flags = Flags.new
    end
  end


  class Flags

    # Creates a new flags object with no flags set.
    def initialize
      @aa = 0
      @tc = 0
      @rd = 0
      @ra = 0
      @z = 0 # 3 reserved bits

      @question_count = 0
      @answer_count = 0
      @authority_record_count = 0
      @additional_record_count = 0
    end

    def authoritative_answer?
      @aa
    end

    def authoritative_answer=(value)
      @aa = bool_to_bit(value)
    end

    def truncation?
      @tc
    end

    def truncation=(value)
      @tc = bool_to_bit(value)
    end

    def recursion_desired?
      @rd
    end

    def recursion_desired=(value)
      @rd = bool_to_bit(value)
    end

    def recursion_available?
      @ra
    end

    def recursion_available=(value)
      @ra = bool_to_bit(value)
    end
  end
end

