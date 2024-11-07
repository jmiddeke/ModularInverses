## Find all m > 1 such that every unit modulo is its own inverse.

from math import gcd
from typing import List

def units(m : int) -> List[int]:
    """Return the list of units modulo m."""
    return [a for a in range(m) if gcd(a, m) == 1]

def auto_inverse(a : int, m : int) -> bool:
    """Is a its own inverse modulo m?"""
    return (a*a % m) == 1

def all_auto_inverses(m : int) -> bool:
    """Are all units modulo m their own inverses?"""
    return all(auto_inverse(a, m) for a in units(m))

results = [m for m in range(2, 49) if all_auto_inverses(m)]

print(results)
