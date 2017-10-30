#include <stdio.h>
#include <string.h>

void never(){
	printf("Never \n");
}


void example(){
	int zero=0;
	char some[5]="AAAA\0"; 
	some[21]=0x2c;
	some[22]=0x56;
	some[23]=0x55;
	some[24]=0x56;

	if ( zero != 0){
		never();
	}
	else{
		printf("Always \n");
	}
}
int main(){
	printf("Address of never : %p \n",never);
	example();
	return 0;
}
