#include <stdio.h>
#include <string.h>
#include <ctype.h>

char prod[20][20];
char first[26][20], follow[26][20];
int n;

int add(char *set, char c)
{
    if (strchr(set, c))
        return 0;
    int len = strlen(set);
    set[len] = c;
    set[len + 1] = '\0';
    return 1;
}

int firstOfString(char *symbols, char *result)
{
    for (int k = 0; symbols[k]; k++)
    {
        char current = symbols[k];

        if (current == '#')
            continue;

        if (!isupper(current))
        {
            add(result, current);
            return 0;
        }

        for (int j = 0; first[current - 'A'][j]; j++)
            if (first[current - 'A'][j] != '#')
                add(result, first[current - 'A'][j]);

        if (!strchr(first[current - 'A'], '#'))
            return 0;
    }
    return 1;
}

void printSet(const char *name, char nonTerminal, char *set)
{
    printf("%s(%c) = { ", name, nonTerminal);
    for (int j = 0; set[j]; j++)
        printf("%c%s", set[j], set[j + 1] ? ", " : " ");
    printf("}\n");
}

int main()
{
    int changed;

    printf("Enter number of productions: ");
    scanf("%d", &n);
    printf("Enter productions (use # for epsilon, e.g. E->TR):\n");
    for (int i = 0; i < n; i++)
        scanf("%s", prod[i]);

    do
    {
        changed = 0;
        for (int p = 0; p < n; p++)
        {
            char leftSide = prod[p][0];
            char *rightSide = prod[p] + 3;
            char firstOfRight[20] = "";
            int nullable = firstOfString(rightSide, firstOfRight);

            for (int j = 0; firstOfRight[j]; j++)
                if (add(first[leftSide - 'A'], firstOfRight[j]))
                    changed = 1;
            if (nullable && add(first[leftSide - 'A'], '#'))
                changed = 1;
        }
    } while (changed);

    add(follow[prod[0][0] - 'A'], '$');
    do
    {
        changed = 0;
        for (int p = 0; p < n; p++)
        {
            char leftSide = prod[p][0];
            char *rightSide = prod[p] + 3;

            for (int i = 0; rightSide[i]; i++)
            {
                char symbol = rightSide[i];
                if (!isupper(symbol))
                    continue;

                char firstOfRest[20] = "";
                int nullable = firstOfString(rightSide + i + 1, firstOfRest);

                for (int j = 0; firstOfRest[j]; j++)
                    if (add(follow[symbol - 'A'], firstOfRest[j]))
                        changed = 1;

                if (nullable)
                    for (int j = 0; follow[leftSide - 'A'][j]; j++)
                        if (add(follow[symbol - 'A'], follow[leftSide - 'A'][j]))
                            changed = 1;
            }
        }
    } while (changed);

    int shown[26] = {0};

    printf("\n");
    for (int p = 0; p < n; p++)
    {
        char nonTerminal = prod[p][0];
        if (!shown[nonTerminal - 'A'])
        {
            shown[nonTerminal - 'A'] = 1;
            printSet("FIRST", nonTerminal, first[nonTerminal - 'A']);
        }
    }

    memset(shown, 0, sizeof(shown));
    printf("\n");
    for (int p = 0; p < n; p++)
    {
        char nonTerminal = prod[p][0];
        if (!shown[nonTerminal - 'A'])
        {
            shown[nonTerminal - 'A'] = 1;
            printSet("FOLLOW", nonTerminal, follow[nonTerminal - 'A']);
        }
    }
    return 0;
}
