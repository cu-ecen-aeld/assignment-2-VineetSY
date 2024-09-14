#include <stdio.h>
#include <syslog.h>

char usageStr[] ="Total number of arguments should be 2.\nThe order of arguments should be:\n  1) Path to the file.\n  2) String to be written in the specified file.\n";

int main(int argc, char**argv)
{
    char * writeFile;
    char * writeStr;
    FILE *fptr = NULL;
    
    openlog(NULL, 0, LOG_USER);

    if (argc != 3u)
    {
        printf("ERROR: Invalid number of arguments: \n%s", usageStr);
        syslog(LOG_ERR, "Invalid number of arguments: %d", argc);
        return 1;
    }
    else
    {
        writeFile = argv[1];
        writeStr = argv[2];

        // printf("argv[1] = %s\nargv[2] = %s\n", writeFile, writeStr);
    }

    // Create a file
    fptr = fopen(writeFile, "w");
    if (fptr != NULL)
    {
        // Write some text to the file
        syslog(LOG_DEBUG, "Writing %s to %s", writeStr, writeFile);
        fprintf(fptr, writeStr);
        fprintf(fptr, "\n");

        // Close the file
        fclose(fptr);
    }
    closelog();
    
    return 0;
}

