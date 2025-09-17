# test/student/student.rb
require "minitest/autorun"
require_relative "../../src/warmup.rb"
require_relative "../../src/phonebook.rb"

class StudentTests < Minitest::Test
  def test_fib_edges
    assert_equal [], fib(0)
    assert_equal [0], fib(1)
  end

  def test_isPalindrome_various
    assert isPalindrome(12321)
    refute isPalindrome(12345)
  end

  def test_nthmax_nil_case
    assert_nil nthmax(5, [1,2,3])
  end

  def test_freq_single_char
    assert_equal "z", freq("zzzz")
  end

  def test_zipHash_lengths
    assert_nil zipHash([1,2], [3])
  end

  def test_phonebook_unlisted_lookup
    pb = PhoneBook.new
    pb.add("Unlisted", "337-555-4444", false)
    assert_nil pb.lookup("Unlisted")
    assert_nil pb.lookupByNum("337-555-4444")
    assert_includes pb.namesByAc("337"), "Unlisted"
  end
end
