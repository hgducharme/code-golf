from pulp import *

# defines the problem
prob = LpProblem("trailMix", LpMinimize)

# declares the variables
c = LpVariable("cashews",  0.05, 1)
f = LpVariable("fiberOne", 0.05, 1)
m = LpVariable("MMs",      0.12, 1)
r = LpVariable("raisins",  0.12, 1)
w = LpVariable("walnuts",  0.05, 1)

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

# print the results
print value(c)
print value(f)
print value(m)
print value(r)
print value(w)