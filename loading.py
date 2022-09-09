#!/bin/python3

from time import sleep, time

def	ft_progress(listy):
	preffix = "ETA :"
	ref = time()
	for i in listy:
		per = i / listy[-1] * 100
		bar = "=" * int(per / 5)
		empty = " " * (20 - len(bar))
		new_ref = format(time() - ref, ".2f")
		print(f'\r{preffix} [ {int(per)}%] [{bar}>{empty}] | elapsed time {new_ref}s', end='')
		yield  i

if __name__ == "__main__":
	listy = range(1000)
	ret = 0
	for elem in ft_progress(listy):
		ret += (elem + 3) % 5
		sleep(0.01)
	print()
	print(ret)
