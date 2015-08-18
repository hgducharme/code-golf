number_of_people = int(raw_input("How many people is this event for? "))
# cost_of_gas = raw_input("How much does gas cost at the moment?")
# distance = raw_input("How many miles away is this event?")

# total event costs
average_pizza_cost = 2.8638
number_of_pizzas = (number_of_people) * (1.15)
cost_of_pizzas = (number_of_pizzas)* (average_pizza_cost)

# transportation_cost = ((distance / 11) * (cost_of_gas)) * 2
# total_utilities = (transportation_cost + 20)
set_up_fee = 75

labor_costs = (50 * 6)
total_cost = cost_of_pizzas + labor_costs

# profits
profit_margin = 1.1
if number_of_people >= 30:
  profit_margin = 1.33

gross_profit = (total_cost * profit_margin) + set_up_fee
cost_per_person = (gross_profit / number_of_people)
net_profit = (gross_profit - total_cost)

# percentages of gross sales
food_cost_percentage = (cost_of_pizzas / gross_profit)*100
labor_cost_percentage = (labor_costs / gross_profit)*100
net_profit_percentage = (net_profit / gross_profit)*100

# format the results
numbers = [gross_profit, cost_per_person, cost_of_pizzas, food_cost_percentage,
labor_costs, labor_cost_percentage, net_profit, net_profit_percentage]

#for x in numbers:
   # print "{:10.4f}".format(x)

# print the results
print "Invoice:           ${}".format(gross_profit)
print "Cost per person:   ${}".format(cost_per_person)
print
print "Business Statistics:"
print "[Dollar amount] --- [Percentage of sales]"
print "- Cost of food:    ${} --- {}%".format(cost_of_pizzas, food_cost_percentage)
print "- Cost of labor:   ${} --- {}%".format(labor_costs, labor_cost_percentage)
print "- Net profit:      ${} --- {}%".format(net_profit, net_profit_percentage)
