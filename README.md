# mruby-rational

Rational class for mruby.

This library does not support build rational instance by string value yet.

## Example

    > a = Rational(1, 4)
     => (1/4)

    > b = Rational(2, 3)
     => (2/3)

    > a + b
     => (11/12)

    > (a + b).to_f
     => 0.91666666666667

    > x = Rational(1, 3) * 2
     => (2/3)

    > y = Rational(1, 2)
     => (1/2)

    > x * y
     => (1/3)


## Implemented methods

### Rational class

 - http://doc.ruby-lang.org/ja/1.9.3/class/Rational.html

| method                  | impl. | note |
|:------------------------|:-----:|:-----|
| Rational#\*             |   o   |      |
| Rational#\*\*           |   o   |      |
| Rational#+              |   o   |      |
| Rational#-              |   o   |      |
| Rational#/              |   o   |      |
| Rational#quo            |   o   |      |
| Rational#<=>            |   o   |      |
| Rational#==             |   o   |      |
| Rational#coerce         |   o   |      |
| Rational#denominator    |   o   |      |
| Rational#fdiv           |   o   |      |
| Rational#floor          |   o   |      |
| Rational#inspect        |   o   |      |
| Rational#marshal\_dump  |   o   |      |
| Rational#marshal\_load  |   o   |      |
| Rational#numerator      |   o   |      |
| Rational#rationalize    |       |      |
| Rational#round          |   o   |      |
| Rational#to\_f          |   o   |      |
| Rational#to\_i          |   o   |      |
| Rational#truncate       |   o   |      |
| Rational#to\_r          |   o   |      |
| Rational#to\_s          |   o   |      |

 - Non regular methods

| method                  | impl. | note |
|:------------------------|:-----:|:-----|
| Rational.new            |   o   |      |
| Rational.convert        |   o   |      |

### Kernel class

 - http://docs.ruby-lang.org/ja/1.9.3/class/Kernel.html

| method                  | impl. | note |
|:------------------------|:-----:|:-----|
| Kernel.#Rational        |   o   |      |

### Numeric class

 - http://docs.ruby-lang.org/ja/1.9.3/method/Numeric/i/quo.html

| method                  | impl. | note |
|:------------------------|:-----:|:-----|
| Numeric#quo             |   o   |      |


## License

MIT License

https://github.com/dyama/mruby-rational/blob/master/LICENSE

## Author

dyama <dyama@member.fsf.org>

