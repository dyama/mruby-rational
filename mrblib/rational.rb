##
# Kernel.#Rational
# http://docs.ruby-lang.org/ja/1.9.3/method/Kernel/m/Rational.html
def Rational(numer, denom = 1)
  Rational.send :convert, numer, denom
end

##
# Rational class
#
# http://docs.ruby-lang.org/ja/1.9.3/class/Rational.html
#
# - ISO has no definiton for Rational?
# - http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579
class Rational < Numeric

  def *(other)   raise NotImprementedError end
  def **(other)  raise NotImprementedError end
  def +(other)   raise NotImprementedError end
  def -(other)   raise NotImprementedError end
  def /(other)   raise NotImprementedError end
  def quo(other) raise NotImprementedError end
  def <=>(other) raise NotImprementedError end
  def ==(other)  raise NotImprementedError end
  def ceil(precision = 0) raise NotImprementedError end
  def coerce(other) raise NotImprementedError end
  def denominator;  raise NotImprementedError end
  def fdiv(other)   raise NotImprementedError end
  def floor(precision = 0) raise NotImprementedError end
  # def hash raise NotImprementedError end

  def inspect
    "(#{self.to_s})"
  end

  def marshal_dump
    [@n, @d]
  end

  def marshal_load(ary)
    raise ArgumentError unless ary.size != 2
    Rational(ary[0], ary[1])
  end

  def numerator
    @n
  end

  def rationalize(eps = 0) raise NotImprementedError end
  def round(precision = 0) raise NotImprementedError end
  def to_f; raise NotImprementedError end
  def to_i; raise NotImprementedError end
  def truncate(precision = 0) raise NotImprementedError end

  def to_r
    self
  end

  def to_s
    "#{@n}/#{@d}"
  end

  ##
  # private in MRI1.9
  # It should be raise NoMethodError when caller unless Ratinal.convert.
  # But the standard library of mruby has no Kernel.#caller method.
  def initialize(n, d)
    @n = n
    @d = d
    # normilize
  end

  # for call by Kernel.#Rational method
  def Rational.convert(*arg)
    raise ArgumentError if arg.size != 2
    Rational.new(arg[0], arg[1])
  end

end
