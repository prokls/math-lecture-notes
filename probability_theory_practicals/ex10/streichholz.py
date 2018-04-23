#!/usr/bin/env python

import itertools

def experiment(n):
    distribution = [0] * (n + 1)
    for outcome in itertools.product({'L', 'R'}, repeat=2*n-1):
        bags = {'L': n, 'R': n}
        for out in outcome:
            bags[out] -= 1
            if bags[out] == 0:
                break

        print(outcome, bags)

        outcome_k = max(bags.values())
        distribution[outcome_k] += 1

    return distribution


print(experiment(5))
