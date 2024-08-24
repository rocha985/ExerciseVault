#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LENGTH 1000

char encrypt(char c, int key) {
    if (isupper(c)) {
        return ((c - 'A' + key) % 26) + 'A';
    } else if (islower(c)) {
        return ((c - 'a' + key) % 26) + 'a';
    } else {
        return c;
    }
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: ./caesar key\n");
        return 1;
    }

    for (int i = 0; argv[1][i] != '\0'; i++) {
        if (!isdigit(argv[1][i])) {
            printf("Key must only contain digits.\n");
            return 1;
        }
    }

    int key = atoi(argv[1]) % 26;
    if (key < 0) key += 26;

    char pt[MAX_LENGTH];
    printf("plaintext: ");
    if (fgets(pt, sizeof(pt), stdin) == NULL) {
        printf("Error reading plaintext.\n");
        return 1;
    }

    pt[strcspn(pt, "\n")] = '\0';

    printf("ciphertext: ");
    for (int i = 0; pt[i] != '\0'; i++) {
        printf("%c", encrypt(pt[i], key));
    }
    printf("\n");

    return 0;
}
