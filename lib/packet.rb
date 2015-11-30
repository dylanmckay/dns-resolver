require_relative 'header'

module Packet
  class Packet
    attr_reader :header, :questions, :answers, :authorities, :additionals

    def initialize(header, questions, answers, authorities, additionals)
      @header = header
      @questions = questions
      @answers = answers
      @authorities = authorities
      @additionals = additionals
    end

    def self.parse(bytes)
      header = Header.parse(bytes[0...12])

      index = 12

      header.question_count.times.map do
        question_bytes = bytes[index...index+4]
        index += 4

        Query.parse(question_bytes)
      end

      header.answer_count.times.map do
        rdata_bytes = bytes[index..-1]
        resource = Resource.parse(rdata_bytes)

        index += 14 + resource.rdata.length

        resource
      end

      # TODO: read other RRs

    end
  end
end
