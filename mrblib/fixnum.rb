class Fixnum
  def quo(other)
    if other.is_a?(Fixnum)
      Rational(self, other)
    else
      super.quo(other)
    end
  end
end
