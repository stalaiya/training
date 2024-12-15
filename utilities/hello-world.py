# Write a regular python function that can be converted to a lambda function

def add(x, y):
    return x + y

def multiply(x, y):
    return x * y

def subtract(x, y):
    return x - y

def divide(x, y):
    return x / y

# Convert the above functions to lambda functions
add_lambda = lambda x, y: x + y
multiply_lambda = lambda x, y: x * y
subtract_lambda = lambda x, y: x - y


def add(x, y):
    return x + y

def division(x, y):
    return x / y

# Convert the above functions to lambda functions
add_lambda = lambda x, y: x + y
division_lambda = lambda x, y: x / y

# Test the lambda functions
print(add_lambda(5, 3)) # Output: 8
print(multiply_lambda(4, 6)) # Output: 24
print(subtract_lambda(10, 7)) # Output: 3






























