def caesar_cipher(inputStringArg, shiftFactor)
  
  # Create a range of ascii values for the entire alphabet for easy reference
  capitalLetterRange = (65..90).to_a
  smallLetterRange = (97..122).to_a
  
  chars = inputStringArg.split('')
  
  chars.each_index do |i|
    charInASCII = chars[i].ord
    
    # Check each character to see if it is an alphabet, if it is not, then it is skipped over
    isAnAlphabet = (capitalLetterRange.include? charInASCII) || (smallLetterRange.include? charInASCII)
    
    if(isAnAlphabet)
      # Check to see if the character is a capital letter or not
      isCapitalLetter = capitalLetterRange.include? charInASCII
      
      charInASCII += shiftFactor
      
      # Perform a wraparound to the beginning of the alphabet if the shifted number has exceeded the valid range
      if(isCapitalLetter)
        if(charInASCII > capitalLetterRange[-1])
          diff = charInASCII - capitalLetterRange[-1]
          charInASCII = capitalLetterRange[0] - 1 + diff
        end
      else
        if(charInASCII > smallLetterRange[-1])
          diff = charInASCII - smallLetterRange[-1]
          charInASCII = smallLetterRange[0] - 1 + diff
        end
      end
      
      chars[i] = charInASCII.chr
    end
    
  end
  
  chars.join()
end

#puts caesar_cipher("What a string!", 5)