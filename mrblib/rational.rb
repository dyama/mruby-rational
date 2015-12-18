##
# Kernel.#Rational
# http://docs.ruby-lang.org/ja/1.9.3/method/Kernel/b/Rational.html
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

  def *(other)
    raise TypeError unless other.is_a?(Numeric)
    if other.is_a?(Rational)
      Rational.new(@num * other.numerator, @den * other.denominator)
    else
      Rational.new(@num * other, @den)
    end
  end

  def **(other)
    raise TypeError unless other.is_a?(Numeric)
    if other.is_a?(Rational)
      (self ** other.numerator) ** (1/other.denominator)
    else
      Rational.new(@num ** other, @den ** other)
    end
  end

  def +(other)
    raise TypeError unless other.is_a?(Numeric)
    if other.is_a?(Rational)
      Rational.new(@num * other.denominator + other.numerator * @den, @den * other.denominator)
    else
      Rational.new(@num + other * @den, @den)
    end
  end

  def -(other)
    raise TypeError unless other.is_a?(Numeric)
    if other.is_a?(Rational)
      Rational.new(@num * other.denominator - other.numerator * @den, @den * other.denominator)
    else
      Rational.new(@num - other * @den, @den)
    end
  end

  def /(other)
    raise TypeError unless other.is_a?(Numeric)
    if other.is_a?(Rational)
      raise ZeroDivisionError if other.numerator == 0
      Rational.new(@num * other.denominator, @den * other.numerator)
    elsif other == other.to_i
      raise ZeroDivisionError if other == 0
      Rational.new(@num / other, @den)
    else
      to_f / other
    end
  end

  def quo(other)
    self / other
  end

  def <=>(other)
    if other.is_a?(Rational)
      to_f <=> other.to_f
    elsif other.is_a?(Numeric)
      to_f <=> other
    else
      nil
    end
  end

  def ==(other)
    return false unless other.is_a?(Rational)
    @num == other.numerator && @den == other.denominator
  end

  def ceil(precision = 0)
    to_f.ceil(precision)
  end

  def coerce(other)
    if other.is_a?(Fixnum)
      [Rational.new(other), self]
    elsif other.is_a?(Float)
      [other, to_f]
    else
      raise TypeError
    end
  end

  def denominator
    @den
  end

  def fdiv(other)
    (self / other).to_f
  end

  def floor(precision = 0)
    to_f.floor(precision)
  end

  def inspect
    "(#{self.to_s})"
  end

  def marshal_dump
    [@num, @den]
  end

  def marshal_load(ary)
    raise ArgumentError unless ary.size != 2
    @num = ary[0]
    @den = ary[1]
    # normalize?
  end

  def numerator
    @num
  end

  def rationalize(eps = 0)
    if eps == 0
      self
    else
      raise NotImprementedError
    end
  end

  def round(precision = 0)
    to_f.round(precision)
  end

  def to_f
    (@num / @den).to_f
  end

  def to_i
    to_f.to_i
  end

  def truncate(precision = 0)
    to_f.truncate(precision)
  end

  def to_r
    self
  end

  def to_s
    "#{@num}/#{@den}"
  end

  ##
  # private in MRI1.9
  # It should be raise NoMethodError when caller unless Ratinal.convert.
  # But the standard library of mruby has no Kernel.#caller method.
  def initialize(numer, denom = 1)
    if !numer.is_a?(Fixnum) && !numer.is_a?(Float)
      raise NotImprementedError, "Not support initialize by String yet"
    end
    raise TypeError unless denom.is_a?(Fixnum)
    @num = numer
    @den = denom
    if @den < 0
      @num = -@num
      @den = -@den
    end
    # Euclidean algorithm
    def greatest_common_divisor(a, b)
      a, b = [a.abs, b.abs].minmax
      return 0 if a == 0
      while b % a != 0 do
        a, b = [a, b].minmax
        x = b
        b = a
        a = x % a
      end
      a.abs
    end
    f = greatest_common_divisor(@num, @den)
    if f > 0
      @num = (@num / f).to_i
      @den = (@den / f).to_i
    elsif f == 0
      @num = 0
      @den = 1
    end
  end

  # for call by Kernel.#Rational method
  def Rational.convert(*arg)
    raise ArgumentError if arg.size != 2
    Rational.new(arg[0], arg[1])
  end

end
