#!/bin/bash

touch main.py

echo \
"#!/bin/python3

def main() -> None:
	pass

if __name__ == \"__main__\":
	main()
" > main.py

chmod +x main.py

vim main.py
