#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <string.h>

#define MAX_LENGTH 1000

int count_letters(const char *text);
int count_words(const char *text);
int count_sentences(const char *text);

int main(void) {
    char text[MAX_LENGTH];
    printf("text: ");
    if (fgets(text, sizeof(text), stdin) == NULL) {
        printf("Error reading input.\n");
        return 1;
    }

    text[strcspn(text, "\n")] = '\0';

    int letters = count_letters(text);
    int words = count_words(text);
    int sentences = count_sentences(text);

    if (words == 0) {
        printf("Text is empty or contains only whitespace.\n");
        return 1;
    }

    float l = (float)letters / words * 100;
    float s = (float)sentences / words * 100;
    float points = (0.0588 * l) - (0.296 * s) - 15.8;

    if (points >= 16) {
        printf("Grade 16+\n");
    }
    else if (points < 1) {
        printf("Before Grade 1\n");
    }
    else {
        int round_points = round(points);
        printf("Grade %d\n", round_points);
    }

    return 0;
}

int count_letters(const char *text) {
    int length = strlen(text);
    int letters = 0;

    for (int i = 0; i < length; i++) {
        if (isalpha(text[i])) {
            letters++;
        }
    }

    return letters;
}

int count_words(const char *text) {
    int length = strlen(text);
    int words = 0;
    int in_word = 0;

    for (int i = 0; i < length; i++) {
        if (isalpha(text[i])) {
            if (!in_word) {
                words++;
                in_word = 1;
            }
        }
        else {
            in_word = 0;
        }
    }

    return words;
}

int count_sentences(const char *text) {
    int length = strlen(text);
    int sentences = 0;

    for (int i = 0; i < length; i++) {
        if (text[i] == '.' || text[i] == '!' || text[i] == '?') {
            sentences++;
        }
    }

    return sentences;
}
