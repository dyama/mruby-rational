##
# Test for Rational class
#

p Rational.class == Class
p Rational.superclass == Numeric

p r = Rational(3, 4)

# * method
p r * 2               == Rational(3, 2)
p r * 4               == Rational(3, 1)
p r * 0.5             == 0.375
p r * Rational(1, 2)  == Rational(3, 8)

# ** method
#p r ** Rational(2, 1) == Rational(9, 16)
p r ** 2              == Rational(9, 16)
#p r ** 2.0            == 0.5625
#p r ** Rational(1, 2) == 0.866025403784439

# + method
p r + Rational(1, 2) == Rational(5, 4)
p r + 1              == Rational(7, 4)
p r + 0.5            == 1.25

# - method
p r - 1              == Rational(-1, 4)
p r - 0.5            == 0.25

# / method
p r / 2              == Rational(3, 8)
p r / 2.0            == Rational(3, 8)
p r / 0.5            == 1.5
p r / Rational(1, 2) == Rational(3, 2)
# p r / 0 # => ZeroDivisionError

# <=> method
p (Rational(2, 3) <=> Rational(2, 3)) == 0
p (Rational(5) <=> 5)                 == 0
p (Rational(2, 3) <=> Rational(1, 3)) == 1
p (Rational(1, 3) <=> 1)              == -1
p (Rational(1, 3) <=> 0.3)            == 1
p (Rational(1, 3) <=> nil)            == nil

# == method
p (Rational(2, 3) == Rational(2, 3))  == true
p (Rational(5) == 5)                  == true
p (Rational(0) == 0.0)                == true
p (Rational(1, 3) == 0.33)            == false
p (Rational(1, 2) == '1/2')           == false

# ceil method
p Rational(3).ceil                    == 3
p Rational(2, 3).ceil                 == 1
p Rational(-3, 2).ceil                == -1
p Rational(-123.456).ceil(+1)         == Rational(-617, 5)
p Rational(-123.456).ceil(+1).to_f    == -123.4
p Rational(-123.456).ceil(0)          == -123
p Rational(-123.456).ceil(-1)         == -120

# coerce method
p Rational(1).coerce(2)   == [Rational(2), Rational(1)]
p Rational(1).coerce(2.2) == [2.2, 1.0]

# denominator method
p Rational(7).denominator       == 1
p Rational(7, 1).denominator    == 1
p Rational(9, -4).denominator   == 4
p Rational(-2, -10).denominator == 5

# fdiv method
p Rational(2, 3).fdiv(1)   == 0.6666666666666666
p Rational(2, 3).fdiv(0.5) == 1.3333333333333333
p Rational(2).fdiv(3)      == 0.6666666666666666

# floor method
p Rational(3).floor                 == 3
p Rational(2, 3).floor              == 0
p Rational(-3, 2).floor             == -2
p Rational(-123.456).floor(+1)      == Rational(-247, 2)
p Rational(-123.456).floor(+1).to_f == -123.5
p Rational(-123.456).floor(0)       == -124
p Rational(-123.456).floor(-1)      == -130

# inspect method
p Rational(5, 8).inspect  == "(5/8)"
p Rational(2).inspect     == "(2/1)"
p Rational(-8, 6).inspect == "(-4/3)"
p Rational(0.5).inspect   == "(1/2)"

# numerator method
p Rational(7).numerator       == 7
p Rational(7, 1).numerator    == 7
p Rational(9, -4).numerator   == -9
p Rational(-2, -10).numerator == 1

# rationalize method
r = Rational(5033165, 16777216)
r.rationalize                 == Rational(5033165, 16777216)
#r.rationalize(Rational(0.01)) == Rational(3, 10)
#r.rationalize(Rational(0.1))  == Rational(1, 3)

# round method
p Rational(3).round     == 3
p Rational(2, 3).round  == 1
p Rational(-3, 2).round == -2
p Rational(-123.456).round(+1)      == Rational(-247, 2)
p Rational(-123.456).round(+1).to_f == -123.5
p Rational(-123.456).round(0)       == -123
p Rational(-123.456).round(-1)      == -120
p Rational(-123.456).round(-2)      == -100

# to_f method
p Rational(2).to_f             == 2.0
p Rational(9, 4).to_f          == 2.25
p Rational(-3, 4).to_f         == -0.75
p Rational(20, 3).to_f         == 6.666666666666667
#p Rational(1, 10**1000).to_f   == 0.0
#p Rational(-1, 10**1000).to_f  == -0.0
#p Rational(10**1000).to_f      == Infinity
#p Rational(-10**1000).to_f     == -Infinity

# to_i method
p Rational(2, 3).to_i   == 0
p Rational(3).to_i      == 3
p Rational(300.6).to_i  == 300
p Rational(98, 71).to_i == 1
p Rational(-30, 2).to_i == -15

# truncate method
p Rational(-123.456).truncate(+1)       == Rational(-617, 5)
p Rational(-123.456).truncate(+1).to_f  == -123.4
p Rational(-123.456).truncate(0)        == -123
p Rational(-123.456).truncate(-1)       == -120

# to_r method
p r.to_r == r

# to_s method
p Rational(3, 4).to_s  == "3/4"
p Rational(8).to_s     == "8"
p Rational(-8, 6).to_s == "-4/3"
p Rational(0.5).to_s   == "1/2"
