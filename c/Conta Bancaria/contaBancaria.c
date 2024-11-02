#include <stdio.h>
#include <string.h>
#include <ctype.h>

struct ContaDoCliente {
 char nome[50];
 float saldo;
 char extrato[100];
};

float CadastroDeConta(struct ContaDoCliente c) {
    printf("***Cadastro do usuario***\n");

    printf("\nNome do usuario: ");
    scanf("%s", &c.nome);

    if (c.saldo <= 0) {
        printf("\nDeposito inicial (Obrigatorio): ");
        scanf("%f", &c.saldo);
    }

    return c.saldo;
}

float deposito(struct ContaDoCliente c) {
    float deposito;

    printf("\nValor a ser depositado: ");
    scanf("%f", &deposito );

    c.saldo = c.saldo + deposito;

    printf("\nDeposito evetuado com sucesso!\n");
    printf("Saldo atual: %.2f\n\n", c.saldo);

    return c.saldo;
}

float saque(struct ContaDoCliente c) {
    float saque;

    printf("\nValor a ser retirado: ");
    scanf("%f", &saque);

    c.saldo = c.saldo - saque;

    printf("\nSaque efetuado com sucesso!\n");
    printf("Saldo atual: %.2f\n\n", c.saldo);

    return c.saldo;
}

float transferencia(struct ContaDoCliente c) {
    float vlrTransferencia;
    char nomeT[50];

    
    printf("\nNome do receptor da transferencia: ");
    scanf("%s", &nomeT);

    printf("Valor a ser Transferido: ");
    scanf("%f", &vlrTransferencia);

    c.saldo = c.saldo - vlrTransferencia;

    printf("\ntransferencia para %s efetuado com sucesso!\n", nomeT);
    printf("Saldo atual: %.2f\n\n", c.saldo);

    return c.saldo;
}

void saldo(struct ContaDoCliente c) {
    printf("\nSaldo atual: %.2f", c.saldo);
}


// ...
void extrato(struct ContaDoCliente c, int op[],float valorOp[], int n) {
    char operacao[15];
    char deposito[10] = "Deposito";
    char saque[10] = "Saque";
    char transferencia[15] = "Transferencia";

    printf("\n\n***Extrato***\n");

    for (int i = 1; i <= n; i++) {
        switch(op[i]) {
            case 1:
                printf("Deposito no valor de %2.f\n", valorOp[i]);
                break;
            case 2:
                printf("Saque no valor de %2.f\n", valorOp[i]);
                break;
            case 3:
                printf("transferencia no valor de %2.f efetuada\n", valorOp[i]);
                break;
        }

    }
    printf("Saldo: %.2f\n\n", c.saldo);

}


int main() {
    struct ContaDoCliente c;
    int continuar = 1;
    int operacao = 0;
    int op[5];
    int n = 0;
    float saldoInicial;
    float valorOp[5];
    c.saldo = CadastroDeConta(c);

    do {
        
        if(operacao != 1 | 2 | 3 | 4 | 5) {
            printf("\n\nQual operaçao deseja fazer: 1. (Deposito)  2. (Saque)  3. (Transferencia)  4. (Checar saldo)\n\n");
            scanf("%i", &operacao);
        }

        switch (operacao) {
            case 1:
                saldoInicial = c.saldo;
                c.saldo = deposito(c);
                op[n] = 1;
                valorOp[n] = c.saldo - saldoInicial;
                printf("%f", valorOp[n]);
                break;
            case 2:
                saldoInicial = c.saldo;
                c.saldo = saque(c);
                op[n] = 2;
                valorOp[n] = c.saldo - saldoInicial;
                break;
            case 3:
                saldoInicial = c.saldo;
                c.saldo = transferencia(c);
                op[n] = 3;
                valorOp[n] = c.saldo - saldoInicial;
                break;
            case 4:
                saldo(c);
                op[n] = 4;
                break;
        }

        n++;
        

        if(continuar != 1 | 2) {
            printf("\nEfetuar outra operaçao? 1. (Sim) 2. (Não)\n");
            scanf("%i", &continuar);
        }

        if (n > 4) {
            printf("\n\n***Numero maximo de operaçoes atingido***\n\n");
        }

    }while (continuar == 1 && n < 5);

    extrato(c, op, valorOp, n);

    return 0;
}