#include <stdio.h>

int main ()
{
    FILE* fp = fopen ("bin_txt.txt", "w");

    fputc ('\0', fp);
    fputc ('T', fp);

    fclose (fp);

    return 0;
}

