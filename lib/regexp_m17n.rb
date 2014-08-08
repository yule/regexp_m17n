module RegexpM17N
  def self.non_empty?(str)
    encoding = str.encoding
    
    #If its dummy encoding, force UTF8
    return str.to_s.force_encoding(Encoding::UTF_8) =~ /^.+$/ if encoding.dummy?

    #enocde the regex as the same encoding as the string
    str =~ Regexp.new('^.+$'.encode(encoding))
  end
end
