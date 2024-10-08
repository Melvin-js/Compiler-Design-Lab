//shift reduce conflict
#include <stdio.h>
#include <string.h>

struct ProductionRule {
    char left[10];
    char right[10];
};

int main() {
    char input[50], stack[50], temp[50], ch[10], *token1, *token2, *substring;
    int i, j, stack_length, substring_length, stack_top, rule_count = 0;
    int shift_possible, reduce_possible, conflict;
    
    struct ProductionRule rules[10];
    
    stack[0] = '\0';
    
    printf("\nEnter the number of production rules: ");
    scanf("%d", &rule_count);
    
    printf("\nEnter the production rules (in the form 'left->right'): \n");
    for (i = 0; i < rule_count; i++) {
        scanf("%s", temp);
        token1 = strtok(temp, "->");
        token2 = strtok(NULL, "->");
        strcpy(rules[i].left, token1);
        strcpy(rules[i].right, token2);
    }
    
    printf("\nEnter the input string: ");
    scanf("%s", input);
    i = 0;
    while (1) {
        shift_possible = 0;
        reduce_possible = 0;
        conflict = 0;
        
        if (i < strlen(input)) {
            ch[0] = '\0';
            j = 0;
            
            if (input[i] >= 'a' && input[i] <= 'z') {
                while (i < strlen(input) && input[i] >= 'a' && input[i] <= 'z') {
                    ch[j++] = input[i++];
                }
            } else {
                ch[j++] = input[i++];
            }
            ch[j] = '\0';
            strcat(stack, ch);
            printf("%-10s", stack);
            for (int k = i; k < strlen(input); k++) {
                printf("%c", input[k]);
            }
            printf("\tShift %s\n", ch);
            shift_possible = 1;
        }
        
        for (j = 0; j < rule_count; j++) {
            substring = strstr(stack, rules[j].right);
            if (substring != NULL) {
                reduce_possible = 1;
                if (shift_possible) {
                    conflict = 1;
                }
                stack_length = strlen(stack);
                substring_length = strlen(substring);
                stack_top = stack_length - substring_length;
                stack[stack_top] = '\0';
                strcat(stack, rules[j].left);
                printf("%-10s", stack);
                for (int k = i; k < strlen(input); k++) {
                    printf("%c", input[k]);
                }
                printf("\tReduce %s->%s\n", rules[j].left, rules[j].right);
                j = -1;  
            }
        }
        
        if (conflict) {
            printf("Warning: Shift-Reduce conflict detected!\n");
        }
        
        if (strcmp(stack, rules[0].left) == 0 && i == strlen(input)) {
            printf("\nAccepted\n");
            break;
        }
        
        if (i == strlen(input) && !reduce_possible) {
            printf("\nNot Accepted\n");
            break;
        }
    }
    return 0;
}
/*OUTPUT
Enter the number of production rules: 3

Enter the production rules (in the form 'left->right'): 
E->E+E
E->E*E
E->id

Enter the input string: id+id*id
id        +id*id	Shift id
E         +id*id	Reduce E->id
Warning: Shift-Reduce conflict detected!
E+        id*id	Shift +
E+id      *id	Shift id
E+E       *id	Reduce E->id
E         *id	Reduce E->E+E
Warning: Shift-Reduce conflict detected!
E*        id	Shift *
E*id      	Shift id
E*E       	Reduce E->id
E         	Reduce E->E*E
Warning: Shift-Reduce conflict detected!

Accepted
*/