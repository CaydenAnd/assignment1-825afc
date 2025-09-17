def fib(n)
  return [] if n == 0
  return [0] if n == 1
  a = [0,1]
  a << a[-1] + a[-2] while a.length < n
  a
end

def isPalindrome(n)
  s = n.to_s
  s == s.reverse
end

def nthmax(n, a)
  a.uniq.sort.reverse[n]
end

def freq(s)
  return "" if s.empty?
  h = Hash.new(0)
  s.each_char { |c| h[c] += 1 }
  h.max_by { |_, v| v }[0]
end

def zipHash(a1, a2)
  return nil unless a1.length == a2.length
  h = {}
  a1.each_with_index { |k, i| h[k] = a2[i] }
  h
end

def hashToArray(h)
  h.keys.map { |k| [k, h[k]] }
end
