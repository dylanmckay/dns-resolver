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
  end
end
