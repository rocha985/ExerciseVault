/*2. Crie um função que receba um número de 1 até 5 e mostre as informações da banda conforme sua
posição.*/

#include <stdio.h>
#include <string.h>

struct Banda {
    char nome[50];
    int numeroDeIntegrantes;
    char tipoDeMusica[20];
    int nota;
};

void getBanda(int numeroDeBandas, struct Banda* bandas) {
    int i;
    printf("\nBandas: \n");

    for (int j = 0; j < numeroDeBandas; j++) {
        printf("%d. %s \n", j + 1, bandas[j].nome);
    }
    
    printf("\nInforme o número da banda que deseja conferir: ");
    scanf("%d", &i); 

    i--;

    if (i >= 0 && i < numeroDeBandas) {
        printf("\n");
        printf("Banda: %s\n", bandas[i].nome);
        printf("Número de integrantes: %d\n", bandas[i].numeroDeIntegrantes);
        printf("Gênero musical: %s\n", bandas[i].tipoDeMusica);
        printf("Nota: %d\n\n", bandas[i].nota);
    } else {
        printf("Número inválido. Tente novamente.\n");
    }
}

int main() {
    struct Banda bandas[10];
    char continuar;
    int i = 0;

    do {
        if (i >= 10) {
            printf("Limite de bandas alcançado.\n");
            break; 
        }

        printf("\nNome da banda: ");
        scanf("%49s", bandas[i].nome);

        printf("Número de integrantes da banda: ");
        scanf("%d", &bandas[i].numeroDeIntegrantes);
    
        printf("Gênero musical da banda: ");
        scanf("%19s", bandas[i].tipoDeMusica);

        printf("Dê uma nota de 0 a 10: ");
        scanf("%d", &bandas[i].nota);

        i++;

        printf("Deseja adicionar outra banda? (s/n) ");
        scanf(" %c", &continuar);

    } while (continuar == 's' || continuar == 'S');

        getBanda(i, bandas);

    return 0; 
}
