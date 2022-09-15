#!/bin/bash

echo \
"int	main(int ac, char *av[]) {
	
	(void)ac;
	(void)av;
	return 0;
}
" > main.c

vim main.c
