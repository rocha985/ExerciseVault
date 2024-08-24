#include <ctype.h>
#include <stdio.h>
#include <string.h>

#define MAX_LENGTH 100

int POINTS[] = {1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10};

int compute_score(const char *word) {
    int score = 0;

    for (int i = 0, len = strlen(word); i < len; i++) {
        if (isalpha(word[i])) {
            if (isupper(word[i])) {
                score += POINTS[word[i] - 'A'];
            }
            else if (islower(word[i])) {
                score += POINTS[word[i] - 'a'];
            }
        }
    }
    
    return score;
}

int main(void) {
    char word1[MAX_LENGTH];
    char word2[MAX_LENGTH];

    printf("Player 1: ");
    if (fgets(word1, sizeof(word1), stdin) == NULL) {
        printf("Error reading input.\n");
        return 1;
    }
    word1[strcspn(word1, "\n")] = '\0';

    printf("Player 2: ");
    if (fgets(word2, sizeof(word2), stdin) == NULL) {
        printf("Error reading input.\n");
        return 1;
    }
    word2[strcspn(word2, "\n")] = '\0';

    int score1 = compute_score(word1);
    int score2 = compute_score(word2);

    if (score1 > score2) {
        printf("Player 1 wins!\n");
    } else if (score1 < score2) {
        printf("Player 2 wins!\n");
    } else {
        printf("Tie!\n");
    }

    return 0;
}


