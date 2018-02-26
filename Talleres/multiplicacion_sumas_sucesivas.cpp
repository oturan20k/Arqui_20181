#include <iostream>
#include <stdio.h>
#include <stdlib.h>

main(){
       multi(7,8)

}

String multi(int a,int b){
    int x= a;
	int y= b;
	int z=0;
	printf("Ingrese el numero 1 de la multiplicacion: ");
	scanf("%d",&x);
	printf("Ingrese el numero 2 de la multiplicacion: ");
	scanf("%d",&y);
	for(int cont=1;cont<=y;cont+=1){
		z=z+x;
	}
	return "el resultado de la multiplicacion es: %d",z);
	

	
}
