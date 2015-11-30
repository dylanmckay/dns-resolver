require_relative 'util'

# A raw DNS packet

module Packet

  class Header

    attr_accessor :id, :query_response_flag, :opcode, :response_code, :flags,
                  :question_count, :answer_count, :authority_count, :additional_count

    def initialize
      @id = 0
      @query_response_flag = 0
      @opcode = 0
      @response_code = 0

      @question_count = 0
      @answer_count = 0
      @authority_count = 0
      @additional_count = 0

      @flags = Flags.new
    end

    def self.parse(bits)
      header = Header.new

      header.id = concatenate_bits(bits[0...16])
      header.query_response_flag = bits[16]
      header.opcode = concatenate_bits(bits[17...21])
      header.aa = bits[21]
      header.tc = bits[22]
      header.rd = bits[23]
      header.ra = bits[24]
      header.z = bits[25]
      header.ad = bits[26]
      header.cd = bits[27]
      header.rcode = concatenate_bits(bits[28..31])

      header.question_count = concatenate_bits(32...48)
      header.answer_count = concatenate_bits(48...64)
      header.authority_count = concatenate_bits(64...80)
      header.additional_count = concatenate_bits(80...96)

      header
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
