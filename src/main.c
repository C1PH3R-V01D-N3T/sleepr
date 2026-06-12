#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
  int secs;

  printf("Enter the time in seconds: ");
  scanf("%d", &secs);
  
  printf("\nThe computer will suspend in %d seconds", secs);
  fflush(stdout);

  sleep(secs);

  system("systemctl suspend");

  return 0;
}
