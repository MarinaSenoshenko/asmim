#include <stdio.h>
#include <stdint.h>
#include <pthread.h>
#include "malloc.h"
#include <Windows.h>

#define THREADS_COUNT 1

int N = 10 * (32 + 32 + 4096 + 16384) * 1024 / 4;
double global_time = 0;

static pthread_barrier_t barrier;

typedef struct Data {
    double time;
    int start;
    int end;
    int* x;
    int* y;
    pthread_barrier_t* bar;
} Data;

extern inline double rdtsc() {
    uint64_t x;
    asm volatile ("rdtsc\n\tshl $32, %%rdx\n\tor %%rdx, %%rax" : "=a" (x) : : "rdx");
    return (double)x;
}

void* write(void *data) {
    Data *local_data = (Data*) data;
    int start = local_data->start;
    int k;
    int end = local_data->end, i;
    double t1, t2;

    int* x = local_data->x;

    pthread_barrier_wait(local_data->bar);
    t1 = rdtsc();
    for (i = start; i < end; i += 16) {
        x[i] = k;
        x[i + 1] = k;
        x[i + 2] = k;
        x[i + 3] = k;
        x[i + 4] = k;
        x[i + 5] = k;
        x[i + 6] = k;
        x[i + 7] = k;
        x[i + 8] = k;
        x[i + 9] = k;
        x[i + 10] = k;
        x[i + 11] = k;
        x[i + 12] = k;
        x[i + 13] = k;
        x[i + 14] = k;
        x[i + 15] = k;
    }
    t2 = rdtsc();

    local_data->time = (t2 - t1);

    pthread_exit(0);
}

void* read(void *data) {
    Data *local_data = (Data*) data;
    int start = local_data->start;
    int k;
    int end = local_data->end, i;
    double t1, t2;

    int* x = local_data->x;

    pthread_barrier_wait(local_data->bar);
    t1 = rdtsc();
    for (i = start; i < end; i += 16) {
        k += x[i];
        k += x[i + 1];
        k += x[i + 2];
        k += x[i + 3];
        k += x[i + 4];
        k += x[i + 5];
        k += x[i + 6];
        k += x[i + 7];
        k += x[i + 8];
        k += x[i + 9];
        k += x[i + 10];
        k += x[i + 11];
        k += x[i + 12];
        k += x[i + 13];
        k += x[i + 14];
        k += x[i + 15];
    }
    t2 = rdtsc();

    local_data->time = (t2 - t1);

    pthread_exit(0);
}

void* copy(void *data) {
    Data *local_data = (Data*) data;
    int start = local_data->start;
    int end = local_data->end, i;
    double t1, t2;

    int* x = local_data->x;
    int* y = local_data->y;

    pthread_barrier_wait(local_data->bar);
    t1 = rdtsc();
    for (i = start; i < end; i+=16) {
        y[i] = x[i];
        y[i + 1] = x[i + 1];
        y[i + 2] = x[i + 2];
        y[i + 3] = x[i + 3];
        y[i + 4] = x[i + 4];
        y[i + 5] = x[i + 5];
        y[i + 6] = x[i + 6];
        y[i + 7] = x[i + 7];
        y[i + 8] = x[i + 8];
        y[i + 9] = x[i + 9];
        y[i + 10] = x[i + 10];
        y[i + 11] = x[i + 11];
        y[i + 12] = x[i + 12];
        y[i + 13] = x[i + 13];
        y[i + 14] = x[i + 14];
        y[i + 15] = x[i + 15];
    }
    t2 = rdtsc();

    local_data->time = (t2 - t1);

    pthread_exit(0);
}

int main() {
    int* x = (int*)malloc(sizeof(double) * N);
    int* y = (int*)malloc(sizeof(double) * N);
    int i;

    for (i = 1; i < N; i++) {
        x[i] = 1;
        y[i] = 2;
    }
    x[N - 1] = 0;
    y[N - 1] = 3;

    pthread_t thread[THREADS_COUNT];
    Data *data = (Data*)malloc(sizeof(Data) * THREADS_COUNT);

    pthread_barrier_init(&barrier, NULL, THREADS_COUNT + 1);

    for (i = 0; i < THREADS_COUNT; i++) {
        data[i].start = i * (N / THREADS_COUNT);
        data[i].end = (i + 1) * N / THREADS_COUNT + 1;
        data[i].x = x;
        data[i].y = y;
        data[i].bar = &barrier;

        DWORD_PTR mask = 1 << i;
        SetThreadAffinityMask((HANDLE) thread[i], mask);

        pthread_create(&thread[i], NULL, copy, &data[i]);
    }

    pthread_barrier_wait(&barrier);

    for (i = 0; i < THREADS_COUNT; i++) {
        pthread_join(thread[i], NULL);
        global_time += data[i].time;
    }

    printf("global time: %lf", global_time / (THREADS_COUNT * N));

    free(x);
    free(y);
    free(data);

    return 0;
}