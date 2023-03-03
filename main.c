#include <stdlib.h>

int ordinasimboli(char* src, char* dst);

int main(void) {

	char src[255] = "ciao5112233 321 mamma@";
	char dst[255];

	int ret = ordinasimboli(src, dst);

	return 0;
}