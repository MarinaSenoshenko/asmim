#include <stdio.h>
#include <stdint.h>
#include "malloc.h"

typedef unsigned long long ull;

extern inline uint64_t rdtsc() {
    uint64_t x;
    __asm__ __volatile__ ("rdtsc\n\tshl $32, %%rdx\n\tor %%rdx, %%rax" : "=a" (x) : : "rdx");
    return x;
}

void heatMem() {
    int N = 1000;
    int** a = (int**)malloc(N * sizeof(int*));
    int** b = (int**)malloc(N * sizeof(int*));
    int** c = (int**)malloc(N * sizeof(int*));
    for (int i = 0; i < N; i++) {
        a[i] = (int*)malloc(N * sizeof(int));
        b[i] = (int*)malloc(N * sizeof(int));
        c[i] = (int*)malloc(N * sizeof(int));
    }
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            a[i][j] = 1;
            b[i][j] = 2;
            c[i][j] = 0;
        }
    }
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            for (int k = 0; k < N; k++) {
                c[i][j] += a[i][k] * b[k][j];
            }
        }
    }
}

int main() {
    double t1, t2;
    double time;    
    int a, k = 1;
    FILE* file = fopen("results.csv", "w");
    heatMem();
    
    for (int k = 1; k <= 100; k++) {
        t1 = rdtsc();
        for (int i = 0; i < 1000000; i++) {
            if (i % k == 0 || (i-1) % k ==0) {
                a = 7;
            }
            if (i < 0) a = 1;
            if (i < 0) a = 1;
            if (i < 0) a = 1;
            if (i < 0) a = 1;
            if (i < 0) a = 1;
            if (i < 0) a = 1;
            if (i < 0) a = 1;
            if (i < 0) a = 1;
            if (i < 0) a = 1;
            if (i < 0) a = 1;
         }  
         t2 = rdtsc();

         time = t2 - t1;

         fprintf(file, "%lf\n", time / 1000000);
    }
}
