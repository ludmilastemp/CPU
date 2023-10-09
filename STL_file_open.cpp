#include "STL_file_open.h"

static int CountNumberOfLines (char* buf, size_t size);

static void SplitIntoLines (struct File* file);

char* STL_Fread (struct File* file)
{
    assert (file);

    struct stat buff = { 0 };

    file->fp = fopen (file->name, "rb");
    assert (file->fp);

    fstat (fileno (file->fp), &buff);

    file->size = buff.st_size;

    file->buf = (char*) calloc (file->size + 1, sizeof (char));
    assert (file->buf);

    file->size = fread (file->buf, sizeof (char), file->size, file->fp);

    /**
     * ¬ставим '\n' в конец файла, чтобы не вставл€ть лишние проверки
     * на каждую итерацию цикла обработки строк.
     */

    if (*(file->buf + file->size - 1) != '\n')
    {
        *(file->buf + file->size) = '\n';
        (file->size)++;
    }

    fclose (file->fp);
    file->fp = nullptr;

    return file->buf;
}

String* STL_SplitFileIntoLines (File* file, const char* name)
{
    assert (file);

    file->name = name;

    file->buf = STL_Fread (file);

    file->nLines = CountNumberOfLines (file->buf, file->size);

    file->strings = (String*) calloc (file->nLines + 1, sizeof (String));
    assert (file->strings);

    SplitIntoLines (file);

    return file->strings;
}

static int CountNumberOfLines (char* buf, size_t size)
{
    size_t numberOfLines = 0;

    char* ptr = buf;
    while (ptr != buf + size - 1)
    {
        ptr = strchr (ptr + 1, '\n');
        numberOfLines++;
    }

    return numberOfLines;
}

static void SplitIntoLines (File* file)
{
    assert (file);

    size_t line = 0;
    size_t pos = 0;

    (file->strings + line)->str = (file->buf + pos);

    line++;
    pos++;

    char* ptr = file->buf;

    for (; line < file->nLines + 1; line++)
    {
        ptr = strchr (ptr + 1, '\n');
        pos = ptr - file->buf;

        (file->strings + line)    ->str = (file->buf + pos + 1);
        (file->strings + line - 1)->len = (file->strings + line)->str
                                          - (file->strings + line - 1)->str - 1;

        pos++;

    }

    (file->strings + line - 1)->len = (file->strings + line)->str
                                      - (file->strings + line - 1)->str - 1;
}

int STL_Fclose (struct File* file)
{
    free (file->buf);
    free (file->strings);

    file->name    = 0;
    file->fp      = nullptr;
    file->buf    = nullptr;
    file->size    = 0;
    file->nLines  = 0;
    file->strings = nullptr;

    return 0;
}
