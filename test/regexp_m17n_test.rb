# encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/regexp_m17n'

class RegexpTest < MiniTest::Unit::TestCase
  def test_non_empty_string
    Encoding.list.reject(&:dummy?).each do |enc|
      assert(RegexpM17N.non_empty?('.'.encode(enc)), "Failed with #{enc}")
    end
  end

  def test_empty_string
    Encoding.list.reject(&:dummy?).each do |enc|
      assert(!RegexpM17N.non_empty?(''.encode(enc)), "Failed with #{enc}")
    end
  end
  
  
  def test_non_empty_string_dummy
    Encoding.list.select(&:dummy?).each do |enc|
      assert(RegexpM17N.non_empty?('.'.force_encoding(enc)), "Failed with #{enc}")
    end
  end
  
  def test_empty_string_dummy
    Encoding.list.select(&:dummy?).each do |enc|
      assert(!RegexpM17N.non_empty?(''.force_encoding(enc)), "Failed with #{enc}")
    end
  end

end
