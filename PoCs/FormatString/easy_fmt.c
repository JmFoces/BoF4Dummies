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
	unsigned int x=0xFFFFFFFF;
	char hola[]="hola";
	printf("x=%08x_%s_%hn\n", x , hola,&x);
	printf("I wrote %08x chars\n",x);

}