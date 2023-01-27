#!/bin/bash

echo \
"#include <stdio.h>

int	main(int ac, char *av[]) {
	
	(void)ac;
	(void)av;
	return 0;
}
" > main.c

vim main.c
