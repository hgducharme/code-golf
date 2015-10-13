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
        # self.toppings only returns the *values* of each topping key
        self.toppings = toppings
        Pizza.instances.append(self)

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
    # 'Topping': [Store Quantity, Quantity Used on Pizza] measured in grams
    'Feta Cheese': [1, 40],
    'Fresh Basil': [28, 1],
    'Italian Sausage': [454, 100],
    'Jalapenos': [18, 15],
    'Mozzarella': [454, 90],
    'Mushrooms': [5, 40],
    'Pepperoni': [184, 60],
    'Red Onions': [125, 40],
    'Spinach': [142, 20],
    'Sweet Onions': [125, 40],
    'Tomato Sauce': [794, 85]
}



# Create each pizza instance
margherita = Pizza('Italiana Margherita', 
    toppings_dictionary['Fresh Basil'],
    toppings_dictionary['Mozzarella'],
    toppings_dictionary['Tomato Sauce'])

pizza_bianca = Pizza('Pizza Bianca', 
    toppings_dictionary['Fresh Basil'],
    toppings_dictionary['Mozzarella'],
    toppings_dictionary['Red Onions'],
    toppings_dictionary['Tomato Sauce'])

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
    toppings_dictionary['Spinach'],
    toppings_dictionary['Tomato Sauce'])



# This dictionary will hold the amounts in grams for each ingredient.
# Will have format: 'Topping': [grams required, packages required]
required_amounts = {}

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



# Output all the numbers in a pretty format
print ""
print "You need the following number of units for each ingredient:"
print ""
print "{0:<20s} {1:6s}      {2:20s}".format(
    "Topping", "Number of Packages",'Weight in Grams')
print "----------------------------------------------------------------"

for topping, amount in required_amounts.iteritems():
    print "{0:<20s} {1:6} units {2:20} g".format(
        topping, int(amount[1]), amount[0])