#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(void) {
    int secs;

    printf("Enter the time in seconds: ");

    if (scanf("%d", &secs) != 1 || secs <= 0) {
        printf("Invalid time.\n");
        return 1;
    }

    printf("\nThe computer will suspend in %d seconds\n", secs);

    for (int i = secs; i > 0; i--) {
        printf("\rSuspending in %d...", i);
        fflush(stdout);
        sleep(1);
    }

    printf("\nSuspending now...\n");

    system("systemctl suspend");

    return 0;
}
