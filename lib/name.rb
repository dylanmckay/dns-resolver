
class Name

  # The parts that make up the name.
  attr_reader :parts

  def initialize(domain)
    @parts = calculate_parts(domain)
  end

  def encoded_name
    @parts.inject([]) do |bytes, part|
      bytes + [part.length] + part.chars
    end
  end

  private
  
  def calculate_parts(domain)
    domain.split(".")
  end
end
