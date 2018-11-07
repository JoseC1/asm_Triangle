#include <stdio.h> //This includes the standard input out put library of C 
#include <stdlib.h>//This includeds the standard libary of C 


extern int asm_main(int answer); //This will allow us to use our assembly function externally 
int getData(char msg[])
{
    int answer = 0; //This will hold the answer the user enters 
    printf("%s\n\n",msg); //THis will print the msg 
    int correct = scanf("%d",&answer); 
    if( correct < 1 || answer < 0) //If the data values do not mach or they entered a neg answer 
    {
        for(int i = 0; i < 10;i++)
        printf("YOU ENTERED INVALID DATA RESTART PROGRAM\n\n\n");
        return -1; 
    }
   //ELSE 
   return answer; //There answer worked 
           
}

int main()
{
    int userData = getData("Please Enter The Size of your Traingle");
    if (userData  <0)
    {
        return -1;//Program failed  
    }
    //ELSE call function 
    asm_main(userData); //Passing this in as a parameter so The parameter will be located 
                        // ebp + 8 = userData 
                        // ebp + 4 = Return address 
                        // ebp = ebp 
                        // ebp -4 = Local Function data 

    return 0;
}
