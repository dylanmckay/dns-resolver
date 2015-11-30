require_relative '../lib/util'

describe "bool_to_bit" do
  it "returns 1 when true" do
    expect(bool_to_bit(true)).to eq 1
  end

  it "expects 0 when false" do
    expect(bool_to_bit(false)).to eq 0
  end

  it "expects 1 when 1" do
    expect(bool_to_bit(1)).to eq 1
  end
end

describe "concatenate_bits" do
  context "when concatenating a simple array" do

    subject { concatenate_bits([1,0,1,1]) }

    it { is_expected.to be_a Fixnum }
    it { is_expected.to eq 0b1011 }
  end
end

describe "concatenate_bytes" do
  context "when concatenating a simple array" do
    subject { concatenate_bytes([1,2,3,4])}

    it { is_expected.to be_a Fixnum }
    it { is_expected.to eq 16909060 }
  end
end

describe "get_bit_from_byte" do
  context "when using a simple byte" do
    let(:byte) { 0b11101100 }

    it "has 0 as the 0th bit" do
      expect(get_bit_from_byte(byte, 0)).to eq 0
    end

    it "has 1 as the 7th bit" do
      expect(get_bit_from_byte(byte, 7)).to eq 1
    end

    it "has 1 as the 6th bit" do
      expect(get_bit_from_byte(byte, 6)).to eq 1
    end

    it "has 1 as the 5th bit" do
      expect(get_bit_from_byte(byte, 5)).to eq 1
    end

    it "has 0 as the 4th bit" do
      expect(get_bit_from_byte(byte, 4)).to eq 0
    end

  end

  describe "bit_array" do
    context "when using a simple array" do
      subject { bit_array([0xff,0x01])}

      it {
        is_expected.to eq [1,1,1,1,1,1,1,1,
                           0,0,0,0,0,0,0,1]
      }
    end
  end

  describe "byte_to_bits" do
    context "when using a simple array" do
      subject { byte_to_bits(0b11001100) }

      it { is_expected.to eq [1,1,0,0,1,1,0,0] }
    end
  end

  describe "value_to_bytes" do
    context "when converting 255" do
      subject { value_to_bytes(255) }

      it { is_expected.to eq [255] }
    end

    context "when converting 256" do
      subject { value_to_bytes(256) }

      it { is_expected.to eq [0,1] }
    end

    context "when converting 0" do
      subject { value_to_bytes(0) }

      it { is_expected.to eq [0] }
    end

    context "when converting 65535" do
      subject { value_to_bytes(65535) }

      it { is_expected.to eq [0xff,0xff] }
    end
  end
end
