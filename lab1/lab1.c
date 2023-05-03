#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <limits.h>
#include <stdint.h> 

#define N 1000

extern inline uint64_t rdtsc() {
    uint64_t x;
    __asm__ __volatile__ ("rdtsc\n\tshl $32, %%rdx\n\tor %%rdx, %%rax" : "=a" (x) : : "rdx");
    return x;
}

void heatMem() {
    int **a = (int**) malloc(N * sizeof(int*));
    int **b = (int**) malloc(N * sizeof(int*));
    int **c = (int**) malloc(N * sizeof(int*));

    for (int i = 0; i < N; i++) {
        a[i] = (int*) malloc(N * sizeof(int));
        b[i] = (int*) malloc(N * sizeof(int));
        c[i] = (int*) malloc(N * sizeof(int));
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

int main(int argc, char* argv[]) {
    FILE * file = fopen("result.txt", "w");	
    int count = 1000000, a1 = 6, a2 = 15;
    float x = 1, value = 3; 
    uint64_t end, begin;
	
    heatMem();

    begin = rdtsc();
    for (int i = 0; i < count; i++) {
	x = x + value;
        x = x + value;
        x = x + value;
        x = x + value;
        x = x + value;
        x = x + value;
    }
    end = rdtsc();

    fprintf(file, "%ld ticks\n", end - begin);
    fprintf(file, "addsd latency: %lf\n\n", (double)(end - begin) / (double)count / (double)a1);
	
    float x1 = 1, x2 = 2, x3 = 3, x4 = 4, x5 = 5, x6 = 6, x7 = 7, x8 = 8;
    float x9 = 9, x10 = 10, x11 = 11, x12 = 12, x13 = 13, x14 = 14, x15 = 15;

    begin = rdtsc();
    for (int i = 0; i < count; i++) {
	x1 = x1 + value;
	x2 = x2 + value;
	x3 = x3 + value;
        x4 = x4 + value;
        x5 = x5 + value;
        x6 = x6 + value;
        x7 = x7 + value;
        x8 = x8 + value;
	x9 = x9 + value;
        x10 = x10 + value;
        x11 = x11 + value;
        x12 = x12 + value;
        x13 = x13 + value;
	x14 = x14 + value;
	x15 = x15 + value;
    }
    end = rdtsc();

    fprintf(file, "%ld ticks\n", end - begin);
    fprintf(file, "addsd throughput: %lf\n\n", (double)(end - begin) / (double)count / (double)a2);
    fclose(file);
}

