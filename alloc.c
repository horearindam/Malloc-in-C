/*alloc.c*/
#include "alloc.h"

extern void *memspace;

int main(int argc, char **argv) {
    int8 *p;

    p = memspace;
    *p = 'X';
    
    return 0;
}
