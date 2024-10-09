#include <stdio.h>

// Importing assembly functions

extern int cmp_string(char *str1, char *str2);

extern void exit(int exitCode);

extern unsigned long parse_int(char *arg);
extern unsigned long parse_uint(char *arg);

extern void print_char(char *character);
extern void print_int(int int_arg);
extern void print_uint(int int_arg);
extern void print_string(char *string_arg);
extern void print_newline();

extern char *read_char();
extern char *read_string();

extern char *string_copy(char *string_arg, char *buffer, int bufferLength);
extern int string_length(char *arg);

void clear_input_buffer()
{
    int c;
    while ((c = getchar()) != '\n' && c != EOF)
        ;
}

void main()
{

    char STRING_TO_COPY[] = "str_cpy";
    char BUFFER_SIZE = 7;
    char buffer[BUFFER_SIZE];

    print_string("String printed from assembly function");
    print_newline();

    print_int(-555);
    print_newline();

    print_uint(54678);
    print_newline();

    print_char("A");
    print_newline();

    int str_len = string_length("Test string");
    // Should print 11
    printf("String length: %d\n", str_len);

    char *read_chr = read_char();
    printf("Input char: %s\n", read_chr);

    clear_input_buffer();

    char *read_str = read_string();
    printf("Input: %s\n", read_str);

    unsigned long pos_int = parse_uint("78910");
    printf("Parsed integer: %lu\n", pos_int);

    // TODO: fix parse issue with negative numbers
    // unsigned long neg_int = parse_int("-78910");
    // printf("Parsed integer: %lu\n", neg_int);

    // Prints strings are not equal
    // int isEqual = cmp_string("Hello", "Hella");

    // Prints strings are equal
    int isEqual = cmp_string("Hello", "Hello");

    if (isEqual)
    {
        printf("Strings are equal\n");
    }
    else
    {
        printf("Strings are not equal\n");
    }

    // TODO: Fix segmentation fault
    // char *copied_str = string_copy(buffer, STRING_TO_COPY, BUFFER_SIZE);

    // if (copied_str == 0)
    // {
    //     printf("String empty or larger than buffer");
    // }
    // else
    // {
    //     printf("Copied string: %s", copied_str);
    // }
    
    exit(0);
}