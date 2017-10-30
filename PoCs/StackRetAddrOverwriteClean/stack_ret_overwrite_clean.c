#include <stdio.h>
#include <string.h>

int do_something(char* from){
	if (from != NULL){
		char vuln_buff[10]="BBBBBBBBBB"; 
		printf("Copy %p @ 0x%p \n", from, vuln_buff);
		memcpy(vuln_buff, from, strlen(from));
	}
	else{
		printf("Give me some argument.\n");
	}
	return 0;
}

int main(int argc, char **argv){
	printf("Hello StackRetOverwrite\n");
	//Vuln Section 
	do_something(argv[1]);
	//End Vuln Section )
	int i = 1;
	if(i > 2){
		printf("that Should never happen\n");
	}
	printf("bye \n");
}

