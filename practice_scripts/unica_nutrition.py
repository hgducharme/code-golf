import math
import pprint



# Create Pizza object 
class Pizza(object):
    instances = []

    name = ""
    toppings = []
    quantities = []

    def __init__(self, name, *toppings):
        self.name = name
        self.toppings = toppings
 
        Pizza.instances.append(self)

    def get_nutrition(self):
        nutrition_amounts = {
        'Calories': 650,
        'Fat': 0,
        'Carbs': 121,
        'Protein': 22
        }

        for topping in self.toppings:
            amount_used = topping [0]
            # Times the topping nutrition for the respective key by amount used
            nutrition_amounts['Calories'] += amount_used * topping[1]
            nutrition_amounts['Fat'] += amount_used * topping[2]
            nutrition_amounts['Carbs'] += amount_used * topping[3]
            nutrition_amounts['Protein'] += amount_used * topping[4]

        return nutrition_amounts

    # This method was create to return the key for each topping key/value tuple
    def list_toppings(self):
        topping_names = []

        for topping in self.toppings:
            for name, quantities in toppings_dictionary.iteritems():
                if topping == quantities:
                    topping_names.append(name)

        return topping_names



# Define all toppings currently used
toppings_dictionary = {
    # 'Topping': [number of servings, calories, fat, carbs, protein]
    ### TODO #### Anything without 5 numbers in the array is incomplete
    'Feta Cheese': [40],
    'Fresh Basil': [1,0,0,0,0],
    'Italian Sausage': [100],
    'Jalapenos': [.15, 28, .4, 7, .9],
    'Mozzarella': [.9, 280, 17, 3.1, 28],
    'Mushrooms': [.40, 22, .3, 3.3, 3.1],
    'Olive Oil': [9,9,1,0,0],
    'Pepperoni': [2.11, 130, 12, 1, 6],
    'Red Onions': [40],
    'Spinach': [20],
    'Sweet Onions': [40],
    'Tomato Sauce': [.85,30,0,6,1]
}



# Create each pizza instance
margherita = Pizza('Italiana Margherita', 
    toppings_dictionary['Fresh Basil'],
    toppings_dictionary['Mozzarella'],
    toppings_dictionary['Tomato Sauce'])

pizza_bianca = Pizza('Pizza Bianca', 
    toppings_dictionary['Fresh Basil'],
    toppings_dictionary['Mozzarella'],
    toppings_dictionary['Red Onions'])

spicy_texano = Pizza('Spicy Texano',
    toppings_dictionary['Jalapenos'],
    toppings_dictionary['Mozzarella'],
    toppings_dictionary['Mushrooms'],
    toppings_dictionary['Pepperoni'],
    toppings_dictionary['Tomato Sauce'])

sweet_fennel_torta = Pizza('Sweet Fennel Torta',
    toppings_dictionary['Italian Sausage'],
    toppings_dictionary['Mozzarella'],
    toppings_dictionary['Sweet Onions'],
    toppings_dictionary['Tomato Sauce'])

italian_flag = Pizza('Italian Flag',
    toppings_dictionary['Feta Cheese'],
    toppings_dictionary['Mozzarella'],
    toppings_dictionary['Red Onions'],
    toppings_dictionary['Spinach'])

'''
# This dictionary will hold the nutritional values for each pizza.
# Will have format: 'Pizza': [Calories, Fat, Carbs, Protein]
pizza_nutrition = {}

for pizza in Pizza.instances:
    number_pizzas = int(raw_input("How many %ss do you need? " % pizza.name))

    # For every pizza topping, multiply the amount used per pizza by the number of pizzas, then update the required_amounts dictionary if the ingredient already exists in the dictionary.
    for i in pizza.list_toppings():
        amount_of_ingredient_needed = toppings_dictionary[i][1] * number_pizzas

        if i in required_amounts:
            required_amounts[i][0] += amount_of_ingredient_needed

        else:
            required_amounts[i] = [amount_of_ingredient_needed]



# Go through each topping in required_amounts and divide by the quantity found each store bought package to output the number of packages needed for that topping.
for topping, amount in required_amounts.iteritems():
    store_package_amount = float(toppings_dictionary[topping][0])
    number_of_packages = math.ceil(amount[0] / store_package_amount)

    required_amounts[topping].append(number_of_packages)
'''


# Output all the numbers in a pretty format
print ""
print "Here is the following nutrition information for the pizza you listed:"
print ""
print "{0:<20s} {1:6s}      {2:20s}  {3:40s}".format(
    "Calories", "Fat",'Carbs', 'Protein')
print "----------------------------------------------------------------"

pizzas = [spicy_texano, margherita]

for i in pizzas:
    x = i.get_nutrition()

    print "{0:<20} {1:4} g {2:10} g {3:15} g".format(
        x['Calories'], x['Fat'], x['Carbs'], x['Protein'])

print ""
print "" 

