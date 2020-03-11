#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <fcntl.h>

#define rozmiarBufora 256

int main()
{
 
int potokFd[2];
 
pipe(potokFd);
 
pid_t childPid=fork();
 
if(childPid < 0)
{
 
    printf("Nie utworzono procesu potomnego!");
   
    return -1;
 
}
if(childPid==0)
{
    close(0);  
 
    close(potokFd[1]);
 
    dup(potokFd[0]);
 
    close(potokFd[0]);
 
    execlp("display", "display", NULL);
}
 

close(potokFd[0]);

 int deskryptor;
 int n ;

 char nazwaPliku[100];
 char bufor [rozmiarBufora];
 
printf("Podaj nazwe pliku: ");
scanf("%s", nazwaPliku);
 
deskryptor = open (nazwaPliku, O_RDONLY);
 
while((n=read(deskryptor, &bufor, rozmiarBufora)) > 0)
{
    write(potokFd[1], &bufor, n);
}

 
close(potokFd[1]);
 
 
    return 0;
}
