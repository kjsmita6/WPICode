#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "project2.h"
#include "student2_helpers.h"

int corrupt(struct pkt packet) {
    int pkt_cs = checksum(packet.acknum, packet.seqnum, packet.payload);
    return pkt_cs == packet.checksum ? FALSE : TRUE;
}

int checksum(int acknum, int seqnum, char *payload) {
    int checksum = 0;
    checksum -= (2 * acknum) - 1;
    checksum += (3 * seqnum) + 2;
    if(payload == NULL) {
        return checksum;
    }
    int i;
    for(i = 0; i < MESSAGE_LENGTH; i++) {
        checksum += ((int)payload[i] * i) - (4 * i);
    }
    return checksum;
}

struct pkt make_packet(int acknum, int seqnum, struct msg payload) {
    struct pkt *temp = (struct pkt *)malloc(sizeof(struct pkt));
    temp->acknum = acknum;
    temp->seqnum = seqnum;
    temp->checksum = checksum(acknum, seqnum, payload.data);
    strncpy(temp->payload, payload.data, MESSAGE_LENGTH);
    return *temp;
}

struct pkt make_ack(int acknum, int seqnum) {
    char payload[20] = "ACK";
    struct pkt *ack = (struct pkt *)malloc(sizeof(struct pkt));
    ack->acknum = acknum;
    ack->seqnum = seqnum;
    ack->checksum = checksum(acknum, seqnum, payload);
    strncpy(ack->payload, payload, MESSAGE_LENGTH);
    return *ack;
}

struct msg make_msg(char *msg) {
    struct msg *temp = (struct msg *)malloc(sizeof(struct msg));
    strncpy(temp->data, msg, MESSAGE_LENGTH);
    return *temp;
}

void create_queue(struct queue *q) {
    //q = (struct queue *)malloc(sizeof(struct queue));
    q->data = (struct msg *)malloc(sizeof(struct msg) * QUEUE_SIZE);
    q->front = q->data;
    q->next = q->data;
    q->end = q->data;
    q->size = 0;
}

int q_empty(struct queue *q) {
    return q->size == 0;
}

int q_full(struct queue *q) {
    return q->size == QUEUE_SIZE;
}

void enqueue(struct queue *q, struct msg data) {
    if(q_full(q)) {
        return;
    }
    strncpy((q->end)->data, data.data, MESSAGE_LENGTH);
    if(q->end == &q->data[QUEUE_SIZE]) {
        q->end = q->data;
    }
    else {
        q->end++;
    }
    q->size++;
}

void dequeue(struct queue *q) {
    if(q_empty(q)) {
        return;
    }
    if(q->front == &q->data[QUEUE_SIZE]) {
        q->front = q->data;
    }
    else {
        q->front++;
    }
    q->size--;
}

struct msg q_find(struct queue *q, int index) {
    struct msg *temp = (struct msg *)malloc(sizeof(struct msg));
    temp = q->front;
    int i;
    for(i = 0; i < index; i++) {
        if(temp == &q->data[QUEUE_SIZE]) {
            temp = q->data;
        }
        else {
            temp++;
        }
    }
    return *temp;
}

struct msg q_shift(struct queue *q) {
    struct msg *temp = (struct msg *)malloc(sizeof(struct msg));
    temp = q->next;
    if(q->next == &q->data[QUEUE_SIZE]) {
        q->next = q->data;
    }
    else {
        q->next++;
    }
    return *temp;
}
