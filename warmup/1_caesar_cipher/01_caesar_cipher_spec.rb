require "01_caesar_cipher"

describe "#caesar_cipher" do
  context "given a standard string" do
    it "returns a standard shifted string" do
      expect(caesar_cipher("What a string!", 5)).to eql("Bmfy f xywnsl!")
    end
  end
  
  context "given an ALL CAPS string" do
    it "returns a shifted string in ALL CAPS" do
      expect(caesar_cipher("WHAT A STRING!", 5)).to eql("BMFY F XYWNSL!")
    end
  end
  
  context "given an ALL LOWERCASE string" do
    it "returns a shifted string in ALL LOWERCASE" do
      expect(caesar_cipher("what a string!", 5)).to eql("bmfy f xywnsl!")
    end
  end
  
  context "given an ALL SYMBOL string" do
    it "returns the same string untouched" do
      expect(caesar_cipher("!@#%^&/*-", 5)).to eql("!@#%^&/*-")
    end
  end
end