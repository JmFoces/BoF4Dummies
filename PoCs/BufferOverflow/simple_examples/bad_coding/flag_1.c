#include <stdio.h>

// git clone https://github.com/jmfoces/Bofs

int main(){
	// Local variable zero. Stores 0x00000000 @ my local stack frame. 
	int zero=0;
	// Local variable some. It's a pointer to the first letter (s) of the word some. Allocates 5 bytes @ stack. 
	char some[5]="some\0"; 
	// Writes out of reserved  space for some. ¿ Where is it writting ?
	some[5]='A';

	if ( zero != 0){
		printf("Never \n");
	}
	else{
		printf("Always \n");
	}
	return 0;
}
