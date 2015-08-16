from pulp import *
import timing

# defines the problem
prob = LpProblem("trailMix", LpMinimize)

# declares the variables
c = LpVariable("cashews",  0.15, 1)
f = LpVariable("fiberOne", 0.15, 1)
m = LpVariable("MMs",      0.12, 1)
r = LpVariable("raisins",  0.12, 1)
w = LpVariable("walnuts",  0.15, 1)

# defines the objective function
prob += 553*c + 200*f + 492*m + 302*r + 654*w   # calories

# defines the constraints
prob += 43.58*c + 2.2*f   + 21.13*m + .46*r   + 65.21*w <= 23.33   # fat 
prob += 30.19*c + 84.59*f + 71.19*m + 79.52*r + 13.71*w <= 46.66   # carbs
prob += 3.3*c   + 47.5*f  + 2.8*m   + 4*r     + 6.7*w   >= 13.33   # fiber
prob += 18.22*c + 6.69*f  + 4.33*m  + 3.39*r  + 15.23*w >= 1       # protein
prob += c + f + m + r + w  >= .85

# solves the problem
status = prob.solve(GLPK(msg=0))
LpStatus[status]

# defines resulting data
amount = (value(c) + value(f) + value(m) + value(r) + value(w))*100
serving_size = 30/amount

total_fat = 43.58*value(c) + 2.2*value(f) + 21.13*value(m) + .46*value(r) + 65.21*value(w)
total_carbs = 30.19*value(c) + 84.59*value(f) + 71.19*value(m) + 79.52*value(r) + 13.71*value(w) 
total_fiber = 3.3*value(c)   + 47.5*value(f)  + 2.8*value(m)   + 4*value(r)     + 6.7*value(w)
total_protein = 18.22*value(c) + 6.69*value(f)  + 4.33*value(m)  + 3.39*value(r)  + 15.23*value(w)

fat_in_serving = serving_size * total_fat
carbs_in_serving = serving_size * total_carbs
fiber_in_serving = serving_size * total_fiber
protein_in_serving = serving_size * total_protein


# print the results
print "Ingredient amounts:"
print "Cashews: {}g".format(value(c)*100)
print "Fiber One: {}g".format(value(f)*100)
print "M&M's: {}g".format(value(m)*100)
print "Golden Raisins: {}g".format(value(r)*100)
print "Walnuts: {}g".format(value(w)*100)

print

print "Nutritional content per 30g:"
print "Fat: {}g".format(fat_in_serving)
print "Carbs: {}g".format(carbs_in_serving)
print "Fiber: {}g".format(fiber_in_serving)
print "Protein: {}g".format(protein_in_serving)