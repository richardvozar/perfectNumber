#include <stdio.h>

extern int is_perfect(int value);

int main() {
	int result = is_perfect(6);
	
	printf("Tokeletes szam? %d\n", result);
	
	return 0;
}
