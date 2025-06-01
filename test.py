def is_prime(n: int):
    """
    # Checks if a given non-negative integer is a prime number.
    #
    Args:
        n: The integer to check.

    Returns:
        True if n is a prime number, False otherwise.
    """
    if n < 2:
        return False  # Numbers less than 2 are not prime

    # 2 and 3 are prime numbers
    if n == 2 or n == 3:
        return True
    # Multiples of 2 and 3 are not prime
    if n % 2 == 0 or n % 3 == 0:
        return False
    i = 5

    while i * i <= n:
        if n % i == 0 or n % (i + 2) == 0:
            return False

    i += 6

    return True


class ded:
    def __init__(self, age):
        self.age = age

    def report_age(self):
        print(self.age)


class ded_2:
    def __init__(self, ded2):
        self.ded2 = ded2


is_prime(5)
