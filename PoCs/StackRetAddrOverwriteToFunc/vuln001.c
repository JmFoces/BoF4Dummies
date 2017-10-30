#include <stdio.h>


int main(int argc, char **argv){
	printf("Hello Stack BoF")
	
	make_it_easy(argv[1]);
	int i = 1;
	i++;
	if(i > 2){
		printf("that Should never happen\n");
	}


	printf("bye");
}
int make_it_easy(char* from){
	// RET @ 0x7fffffffbd28
	char vuln_buff[100]="BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"; 
	printf("Vuln @ 0x%16x\n",&vuln_buff);
	memcpy(vuln_buff, from,strlen(from));
	printf("Bye Vuln");
}
