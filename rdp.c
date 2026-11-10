#include <stdio.h>

char input[100];
int ip = 0;

int E();
int E1();
int T();
int T1();
int F();

int E()
{
    if (T())
        return E1();
    return 0;
}

int E1()
{
    if (input[ip] == '+')
    {
        ip++;
        if (T())
            return E1();
        return 0;
    }
    return 1;
}

int T()
{
    if (F())
        return T1();
    return 0;
}

int T1()
{
    if (input[ip] == '*')
    {
        ip++;
        if (F())
            return T1();
        return 0;
    }
    return 1;
}

int F()
{
    if (input[ip] == 'i')
    {
        ip++;
        return 1;
    }

    if (input[ip] == '(')
    {
        ip++;
        if (E() && input[ip] == ')')
        {
            ip++;
            return 1;
        }
        return 0;
    }

    return 0;
}

int main()
{
    printf("Grammar:\n");
    printf("E  -> T E'\n");
    printf("E' -> + T E' | e\n");
    printf("T  -> F T'\n");
    printf("T' -> * F T' | e\n");
    printf("F  -> ( E ) | i\n\n");

    printf("Enter expression (use i for identifier): ");
    scanf("%99s", input);

    if (E() && input[ip] == '\0')
        printf("\nInput Accepted\n");
    else
        printf("\nInput Rejected\n");

    return 0;
}
