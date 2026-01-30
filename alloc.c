/*alloc.c*/
#include "alloc.h"

extern void *memspace;

void *alloc(int32 byteC) {
    word words;
    header *hdr;
    void *memo;

    words=(!(byteC%4)) ?
            byteC/4 : (byteC/4)+1;

    memo = $v memspace;
    hdr = $h memo;

    hdr->w = 1;

    (!(hdr->w)) ? ({
        printf("Empty\n");
        exit(0);
    })
    : ({
        printf("not Empty\n");
        exit(0);
    });

    return $v 0;
}

int main(int argc, char **argv) {

    alloc(7);
    return 0;
}
