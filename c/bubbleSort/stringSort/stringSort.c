#include <stdio.h>
#include <string.h>

#define MAX_STRINGS 10

void bubbleSortStrings(char strings[][100], int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (strcmp(strings[j], strings[j + 1]) > 0) {
                char temp[100];

                strcpy(temp, strings[j]);
                strcpy(strings[j], strings[j + 1]);
                strcpy(strings[j + 1], temp);
            }
        }
    }
}

int main() {
    char strings[MAX_STRINGS][100];
    int n;

    printf("numero de strings: ");
    scanf("%d", &n);

    if (n > MAX_STRINGS) {
        printf("Error: Number of strings exceeds the maximum allowed (%d).\n", MAX_STRINGS);
        return 1;
    }

    for (int i = 0; i < n; i++) {
        printf("String %d: ", i + 1);
        scanf("%s", strings[i]);
    }

    bubbleSortStrings(strings, n);

    printf("\nStrings em ordem alfabetica:\n");
    for (int i = 0; i < n; i++) {
        printf("%s\n", strings[i]);
    }

    return 0;
}
