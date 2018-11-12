=begin

CALCULATOR
___________

This calculator can perform addition, substraction, multiplication, division and modulo between two numbers.

It takes the following user inputs - 

First number:
Operator [ +  -  *  /  mod ]:
Second number:

=end

puts
puts 'Calculator'
20.times {print '-'}
puts
puts
print "Enter the first number: "
num1 = gets.chomp.to_f
print "Enter the operator [ +  -  *  /  mod ]: "
operator = gets.chomp
print "Enter the second number: "
num2 = gets.chomp.to_f
puts

def multiply(n1, n2)
    n1 * n2
end

def divide(n1, n2)
    if n2 == 0
        "Undefined: zero denominator"
    else
        n1 / n2
    end
end

def sum(n1, n2)
    n1 + n2
end

def subtract(n1, n2)
    n1 - n2   
end

def remainder(n1, n2)
    n1 % n2
end

case operator
when '*'
    puts "[  #{num1} #{operator} #{num2} =  #{multiply num1, num2}  ]"
    puts
when '/'
    puts "[  #{num1} #{operator} #{num2} =  #{divide num1, num2}  ]"
    puts   
when '+'
    puts "[  #{num1} #{operator} #{num2} =  #{sum num1, num2}  ]"
    puts
when '-'
    puts "[  #{num1} #{operator} #{num2} =  #{subtract num1, num2}  ]"
    puts
when 'mod'
    puts "[  #{num1} #{operator} #{num2} =  #{remainder num1, num2}  ]"
    puts
end


