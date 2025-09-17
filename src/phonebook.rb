class PhoneBook
  def initialize
    @by_name = {}
    @by_number = {}
  end

  def add(name, number, is_listed)
    return false if @by_name.key?(name)
    return false unless number =~ /^[1-9]\d{2}-\d{3}-\d{4}$/
    if @by_number.key?(number) && @by_number[number][:listed] && is_listed
      return false
    end
    @by_name[name] = { number: number, listed: is_listed }
    info = (@by_number[number] ||= { listed: false, names: [] })
    info[:names] << name
    info[:listed] ||= is_listed
    true
  end

  def lookup(name)
    e = @by_name[name]
    e && e[:listed] ? e[:number] : nil
  end

  def lookupByNum(number)
    info = @by_number[number]
    return nil unless info && info[:listed]
    info[:names].find { |n| @by_name[n][:listed] }
  end

  def namesByAc(ac)
    pfx = "#{ac}-"
    @by_name.each_with_object([]) { |(n,e),r| r << n if e[:number].start_with?(pfx) }
  end
end
