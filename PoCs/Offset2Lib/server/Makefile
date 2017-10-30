

all: clean compile

compile:
	gcc server_64_PIE_SSP.c -o server_64_PIE_SSP -m64 -Wall -g -fPIE -pie -fstack-protector-all

clean:
	rm -f server_64_PIE_SSP 
