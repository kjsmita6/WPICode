#ifndef STUDENT2_HELPERS_H
#define STUDENT2_HELPERS_H

#define TRUE 1
#define FALSE 0

#define QUEUE_SIZE 64
#define MAX_WAIT 64

struct queue {
    struct msg *data;
    struct msg *front;
    struct msg *next;
    struct msg *end;
    int size;
};

int corrupt(struct pkt packet);
int checksum(int acknum, int seqnum, char *payload);
struct pkt make_packet(int acknum, int seqnum, struct msg payload);
struct pkt make_ack(int acknum, int seqnum);
struct msg make_msg(char *msg);

void create_queue(struct queue *q);
int q_empty(struct queue *q);
int q_full(struct queue *q);
void enqueue(struct queue *q, struct msg data);
void dequeue(struct queue *q);
struct msg q_find(struct queue *q, int index);
struct msg q_shift(struct queue *q);

#endif


