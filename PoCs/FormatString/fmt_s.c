#include <stdio.h>
#include <string.h>


int never(){
	printf("Never\n");
}

int echo(char* arg){
	char some[30000];
	memset(some,0x99,30000-2);
	some[30000-1]='\x00';
	memcpy(some,arg,strlen(arg)+1);
	printf(some);
	printf("\n");
}

int main(int argc, char **argv){
	int x=0;
	if (argc > 1){
		echo(argv[1]);
	}else{
		printf("No parameters");
	}

	if (x != 0){
		never();
	}
	

}