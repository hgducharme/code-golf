import timing
from math import sqrt

start_number = int(raw_input("Please enter the starting number: "))
end_number = int(raw_input("Please enter the ending number: "))

# retrieves fibbonacci numbers
def F():
    a,b = 0,1
    yield a
    yield b
    while True:
        a, b = b, a + b
        yield b

# retrieves fibbonacci numbers within a specified range
def SubFib(start, end):
    for cur in F():
        if cur > end: return
        if cur >= start:
            yield cur

# checks to see if fib number is even, then adds it to the sum if true
sum_of_even_fibs = 0
for i in SubFib(start_number, end_number):
    if i % 2 == 0:
      sum_of_even_fibs += i

print "The sum of all even fibbonacci numbers below the ending number is: {}".format(sum_of_even_fibs)