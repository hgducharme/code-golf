import timing
from math import sqrt

print "Please enter the starting number: "
start_number = int(raw_input())
print "Please enter the ending number: "
end_number = int(raw_input())

def F():
    a,b = 0,1
    yield a
    yield b
    while True:
        a, b = b, a + b
        yield b

def SubFib(start_number, end_number):
    for cur in F():
        if cur > end_number: return
        if cur >= start_number:
            yield cur

sum_of_even_fibs = 0
for i in SubFib(start_number, end_number):
    if i % 2 == 0:
      sum_of_even_fibs += i

print "The sum of all even fibbonacci numbers below the ending number is: {}".format(sum_of_even_fibs)