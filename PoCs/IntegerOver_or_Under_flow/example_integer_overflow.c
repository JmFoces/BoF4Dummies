#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <limits.h>


void positive_pow(int32_t base, int32_t exponent,uint32_t* result){
	printf( "Raising %d to %d : %d \n",base, exponent, *result );
	printf( "Raising %08x to %08x : %08x \n", base, exponent, *result );
	if ( base <= 0 || exponent <= 0 || *result <= 0 ){
		return ;
	}
	else {
		*result = base * *result;
		exponent = exponent - 1;
		positive_pow(base,exponent,result);
	}
}

int count(int to){
	//FORCE WARNby param.
	int x=0;
	x++;
	int prev=0;
	while (x > 0){
		prev=x;
		x++;
	}
	printf("Prev %d\n",prev);
	x=-1;
	while (x < 0){
		prev=x;
		x--;
	}
	printf("Prev %d\n",prev);

}

int main(int argc, char **argv) {
	printf("INT_MAX %d\n", INT_MAX);
	if (argc < 3 ){
		printf("Provide a number to be raised at power \n");
		count(INT_MAX+1);
		exit(1);
	}
	printf("Powering %s to %s\n",argv[1],argv[2]);
	int32_t x = atoi(argv[1]);
	int32_t at = atoi(argv[2]);
	int32_t result = 1; //Init this at least to one!
	positive_pow(x,at,&result);
	printf("Result %d \n",result);
	return (0);
}

