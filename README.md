RPN Calculator
==============

My implementation of RPN Calculator.

It should operate on last two values and push the result.

If there is no operand left, return nil.

If there is one operand, return the operand.

### How to run

* Load it up in irb 

```ruby
$ irb
1.9.3-p194 :001 > load 'rpn.rb'
```

* Put some numbers and operators

```ruby
1.9.3-p194 :002 > r = Rpn.new
1.9.3-p194 :003 > r.get_prompt
> 1
1
> 2
2
> 3
3
> 4
4
> +
7
> +
9
> +
10
> 2
2
> *
20
> 10
10
> /
2.0
> 3 
3
> -
-1.0
> q
 => nil 
```

### How to test

```ruby
$ rspec ./spec/rpn_spec.rb
```