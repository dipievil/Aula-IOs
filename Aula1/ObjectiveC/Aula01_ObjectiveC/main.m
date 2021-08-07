//
//  main.m
//  Aula01_ObjectiveC
//
//  Created by IOS SENAC on 31/07/21.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        int x = 5;
        
        x++;
        
        NSLog(@"%d", x);
        
        NSString *nome = [[NSString alloc] initWithString:@"dipi"];
        
        NSString *sobrenome = @"evil";
        
        NSNumber *altura = [[NSNumber alloc] initWithFloat: 1.80];
        
        NSLog(@"Nome: %@ \nSobrenome: %@ \nAltura: %@",nome, sobrenome, altura);
                
        int z = 0;
        
        for(int y=0; y <= 100; y++){
            z = y+z;
        }
        
        NSLog(@"Desafio 1: %d",z);
        
        int factorial = 5;
        int f = 5;
        do{
	            factorial = factorial*(f-1);
            f--;
        }
        while(f>1);
        
        NSLog(@"Desafio 2: %d", factorial);
        
    }
    return 0;
}
 
