##
# Test for Rational class
#

assert('Rational class') do
  assert_kind_of(Class, Rational.class)
  assert_equal(Numeric, Rational.superclass)
end

# * method
assert('Rational#*') do
  r = Rational(3, 4)
  assert_equal(Rational(3, 2),  r * 2)
  assert_equal(Rational(3, 1),  r * 4)
  assert_float(0.375,           r * 0.5)
  assert_equal(Rational(3, 8),  r * Rational(1, 2))
end

# ** method
assert('Rational#**') do
  r = Rational(3, 4)
  #p r ** Rational(2, 1) == Rational(9, 16)
  assert_equal(Rational(9, 16), r ** 2)
  #p r ** 2.0            == 0.5625
  #p r ** Rational(1, 2) == 0.866025403784439
end

# + method
assert('Rational#+') do
  r = Rational(3, 4)
  assert_equal(Rational(5, 4), r + Rational(1, 2))
  assert_equal(Rational(7, 4), r + 1)
  # assert_equal(1.25, r + 0.5)
end

# - method
assert('Rational#-') do
  r = Rational(3, 4)
  assert_equal(Rational(-1, 4), r - 1)
  # assert_equal(0.25, r - 0.5)
end

# / method
assert('Rational#/') do
  r = Rational(3, 4)
  assert_equal(Rational(3, 8),  r / 2)
  assert_equal(Rational(3, 8),  r / 2.0)
  assert_equal(1.5,             r / 0.5)
  assert_equal(Rational(3, 2),  r / Rational(1, 2))
  # assert_raise(ZeroDivisionError, r / 0)  # No ZeroDivisionError in mruby
end

# <=> method
assert('Rational#<=>') do
  assert_equal(0,   Rational(2, 3) <=> Rational(2, 3))
  assert_equal(0,   Rational(5) <=> 5)
  assert_equal(1,   Rational(2, 3) <=> Rational(1, 3))
  assert_equal(-1,  Rational(1, 3) <=> 1)
  assert_equal(1,   Rational(1, 3) <=> 0.3)
  assert_nil(Rational(1, 3) <=> nil)
end

# == method
assert('Rational#==') do
  assert_true(Rational(2, 3) == Rational(2, 3))
  # assert_true(Rational(5) == 5)
  # assert_true(Rational(0) == 0.0)
  assert_false(Rational(1, 3) == 0.33)
  assert_false(Rational(1, 2) == '1/2')
end

# ceil method
assert('Rational#ceil') do
  assert_equal(3,     Rational(3).ceil)
  assert_equal(1,     Rational(2, 3).ceil)
  assert_equal(-1,    Rational(-3, 2).ceil)
  # assert_equal(Rational(-617, 5), Rational(-123.456).ceil(+1))  # ceil(n) not work
  # assert_float(-123.4, Rational(-123.456).ceil(+1).to_f)        # ceil(n) not work
  assert_equal(-123,  Rational(-123.456).ceil(0))
  # assert_equal(-120, Rational(-123.456).ceil(-1))               # ceil(n) not work
end

# coerce method
assert('Rational#coerce') do
  assert_equal([Rational(2), Rational(1)],  Rational(1).coerce(2))
  assert_equal([2.2, 1.0],                  Rational(1).coerce(2.2))
end

# denominator method
assert('Rational#denominator') do
  assert_equal(1, Rational(7).denominator)
  assert_equal(1, Rational(7, 1).denominator)
  assert_equal(4, Rational(9, -4).denominator)
  assert_equal(5, Rational(-2, -10).denominator)
end

# fdiv method
assert('Rational#fdiv') do
  assert_float(0.6666666666666666, Rational(2, 3).fdiv(1))
  assert_float(1.3333333333333333, Rational(2, 3).fdiv(0.5))
  assert_float(0.6666666666666666, Rational(2).fdiv(3))
end

# floor method
assert('Rational#floor') do
  assert_equal(3,     Rational(3).floor)
  assert_equal(0,     Rational(2, 3).floor)
  assert_equal(-2,    Rational(-3, 2).floor)
  # assert_equal(Rational(-247, 2), Rational(-123.456).floor(+1)) # floor(n) not work
  # assert_equal(-123.5, Rational(-123.456).floor(+1).to_f)       # floor(n) not work
  assert_equal(-124,  Rational(-123.456).floor(0))
  # assert_equal(-130, Rational(-123.456).floor(-1))              # floor(n) not work
end

# inspect method
assert('Rational#inspect') do
  assert_equal("(5/8)",   Rational(5, 8).inspect)
  assert_equal("(2/1)",   Rational(2).inspect)
  assert_equal("(-4/3)",  Rational(-8, 6).inspect)
  assert_equal("(1/2)",   Rational(0.5).inspect)
end

# numerator method
assert('Rational#numerator') do
  assert_equal(7,   Rational(7).numerator)
  assert_equal(7,   Rational(7, 1).numerator)
  assert_equal(-9,  Rational(9, -4).numerator)
  assert_equal(1,   Rational(-2, -10).numerator)
end

# rationalize method
assert('Rational#rationalize') do
r = Rational(5033165, 16777216)
  assert_equal(Rational(5033165, 16777216), r.rationalize)
  #r.rationalize(Rational(0.01)) == Rational(3, 10)
  #r.rationalize(Rational(0.1))  == Rational(1, 3)
end

# round method
assert('Rational#round') do
  assert_equal(3,       Rational(3).round)
  assert_equal(1,       Rational(2, 3).round)
  assert_equal(-2,      Rational(-3, 2).round)
  # assert_equal(Rational(-247, 2), Rational(-123.456).round(+1))
  assert_equal(-123.5,  Rational(-123.456).round(+1).to_f)
  assert_equal(-123,    Rational(-123.456).round(0))
  assert_equal(-120,    Rational(-123.456).round(-1))
  assert_equal(-100,    Rational(-123.456).round(-2))
end

# to_f method
assert('Rational#to_f') do
  assert_equal(2.0,   Rational(2).to_f)
  assert_equal(2.25,  Rational(9, 4).to_f)
  assert_equal(-0.75, Rational(-3, 4).to_f)
  assert_float(6.666666666666667, Rational(20, 3).to_f)
  #p Rational(1, 10**1000).to_f   == 0.0
  #p Rational(-1, 10**1000).to_f  == -0.0
  #p Rational(10**1000).to_f      == Infinity
  #p Rational(-10**1000).to_f     == -Infinity
end

# to_i method
assert('Rational#to_i') do
  assert_equal(0,   Rational(2, 3).to_i)
  assert_equal(3,   Rational(3).to_i)
  assert_equal(300, Rational(300.6).to_i)
  assert_equal(1,   Rational(98, 71).to_i)
  assert_equal(-15, Rational(-30, 2).to_i)
end

# truncate method
assert('Rational#truncate') do
  # assert_equal(Rational(-617, 5), Rational(-123.456).truncate(+1))  # truncate(n) not work
  # assert_equal(-123.4, Rational(-123.456).truncate(+1).to_f)        # truncate(n) not work
  assert_equal(-123, Rational(-123.456).truncate(0))
  # assert_equal(-120, Rational(-123.456).truncate(-1))               # truncate(n) not work
end

# to_r method
assert('Rational#to_r') do
  r = Rational(3, 4)
  assert_equal(r, r.to_r)
end

# to_s method
assert('Rational#to_s') do
  assert_equal("3/4",   Rational(3, 4).to_s)
  assert_equal("8/1",   Rational(8).to_s)
  assert_equal("-4/3",  Rational(-8, 6).to_s)
  assert_equal("1/2",   Rational(0.5).to_s)
end
