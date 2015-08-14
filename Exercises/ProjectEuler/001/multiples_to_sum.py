import timing

sum_multiples = 0
x = 0
while x < 1000:
  if (x % 5 == 0) or (x % 3 == 0):
    sum_multiples += x
  x += 1

print "The sum of all multiples of three and five less than 1000 is: {}.".format(sum_multiples)