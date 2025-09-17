# test/public/public.rb
require "minitest/autorun"
require_relative "../../src/warmup.rb"
require_relative "../../src/phonebook.rb"

class PublicTests < Minitest::Test

  def test_fib
    assert_equal [], fib(0)
    assert_equal [0], fib(1)
    assert_equal [0,1], fib(2)
    assert_equal [0,1,1,2,3], fib(5)
  end

  def test_isPalindrome
    assert_equal true, isPalindrome(121)
    assert_equal false, isPalindrome(123)
    assert_equal true, isPalindrome(7)
  end

  def test_nthmax
    assert_equal 9, nthmax(0, [9,4,4,1])
    assert_equal 4, nthmax(1, [9,4,4,1])
    assert_equal 1, nthmax(2, [9,4,4,1])
    assert_nil nthmax(3, [9,4,4,1])
  end

  def test_freq
    assert_equal "a", freq("aabbba")
    assert_equal "", freq("")
  end

  def test_zipHash
    assert_equal({"a"=>1,"b"=>2}, zipHash(["a","b"], [1,2]))
    assert_nil zipHash(["a"], [1,2])
  end

  def test_hashToArray
    h = {"x"=>10,"y"=>20}
    assert_equal [["x",10],["y",20]], hashToArray(h)
  end

  def test_phonebook_add_and_lookup
    pb = PhoneBook.new
    assert pb.add("Ann", "225-555-1111", true)
    refute pb.add("Ann", "225-555-2222", true) # duplicate name
    refute pb.add("Bob", "025-555-3333", true) # invalid number
    assert_equal "225-555-1111", pb.lookup("Ann")
    assert_nil pb.lookup("Bob")
  end

  def test_phonebook_listing_rules
    pb = PhoneBook.new
    assert pb.add("Ann", "225-555-1111", true)
    refute pb.add("Cal", "225-555-1111", true)  # already listed
    assert pb.add("Cal", "225-555-1111", false) # unlisted allowed
    assert_equal "Ann", pb.lookupByNum("225-555-1111")
    assert_includes pb.namesByAc("225"), "Ann"
    assert_includes pb.namesByAc("225"), "Cal"
  end
end
