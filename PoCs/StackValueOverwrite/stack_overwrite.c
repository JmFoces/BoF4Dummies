#include <stdio.h>
#include <string.h>


int main(int argc, char **argv){
	printf("Hello Stack StackOverwrite");
	int i = 1;	

	//Vuln Section 
	char vuln_buff[100]="BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"; 
	printf("Copy %p @ 0x%p \n", argv[1],vuln_buff);
	memcpy(vuln_buff, argv[1],strlen(argv[1]));
	//End Vuln Section 

	if(i > 2){
		printf("that Should never happen\n");
	}

	printf("bye \n");
}
