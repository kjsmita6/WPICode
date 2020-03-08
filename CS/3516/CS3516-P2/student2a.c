#include <stdio.h>
#include <stdlib.h>
#include "project2.h"
#include "student2_helpers.h"

/* ***************************************************************************
 ALTERNATING BIT AND GO-BACK-N NETWORK EMULATOR: VERSION 1.1  J.F.Kurose

   This code should be used for unidirectional or bidirectional
   data transfer protocols from A to B and B to A.
   Network properties:
   - one way network delay averages five time units (longer if there
     are other messages in the channel for GBN), but can be larger
   - packets can be corrupted (either the header or the data portion)
     or lost, according to user-defined probabilities
   - packets may be delivered out of order.

   Compile as gcc -g project2.c student2.c -o p2
**********************************************************************/


struct queue queue_A;
int seqnum_A_total;
int seqnum_A_start;
int seqnum_A_next;

/********* STUDENTS WRITE THE NEXT SEVEN ROUTINES *********/
/*
 * The routines you will write are detailed below. As noted above,
 * such procedures in real-life would be part of the operating system,
 * and would be called by other procedures in the operating system.
 * All these routines are in layer 4.
 */

/*
 * A_output(message), where message is a structure of type msg, containing
 * data to be sent to the B-side. This routine will be called whenever the
 * upper layer at the sending side (A) has a message to send. It is the job
 * of your protocol to insure that the data in such a message is delivered
 * in-order, and correctly, to the receiving side upper layer.
 */
void A_output(struct msg message) {
    enqueue(&queue_A, message);
    seqnum_A_total++;
    if(seqnum_A_start + 8 >= seqnum_A_total) {
        tolayer3(0, make_packet(0, seqnum_A_next, q_shift(&queue_A)));
        if(seqnum_A_start == seqnum_A_next) {
            startTimer(0, MAX_WAIT);
        }
        seqnum_A_next++;
    }
}

/*
 * A_input(packet), where packet is a structure of type pkt. This routine
 * will be called whenever a packet sent from the B-side (i.e., as a result
 * of a tolayer3() being done by a B-side procedure) arrives at the A-side.
 * packet is the (possibly corrupted) packet sent from the B-side.
 */
void A_input(struct pkt packet) {
    if(!corrupt(packet) && packet.acknum >= seqnum_A_start) {
        stopTimer(0);
        int difference = (packet.acknum + 1) - seqnum_A_start;
        int i;
        for(i = 0; i < difference; i++) {
            dequeue(&queue_A);
            seqnum_A_start++;
            if(seqnum_A_next < seqnum_A_total){
                tolayer3(0, make_packet(0, seqnum_A_next, q_shift(&queue_A)));
                seqnum_A_next++;
            }
        }
        startTimer(0, MAX_WAIT);
    }
}

/*
 * A_timerinterrupt()  This routine will be called when A's timer expires
 * (thus generating a timer interrupt). You'll probably want to use this
 * routine to control the retransmission of packets. See starttimer()
 * and stoptimer() in the writeup for how the timer is started and stopped.
 */
void A_timerinterrupt() {
    int difference = seqnum_A_next - seqnum_A_start;
    int i;
    for(i = 0; i < difference; i++) {
        tolayer3(0, make_packet(0, seqnum_A_start + i, q_find(&queue_A, i)));
    }
    startTimer(0, MAX_WAIT);
}

/* The following routine will be called once (only) before any other    */
/* entity A routines are called. You can use it to do any initialization */
void A_init() {
    create_queue(&queue_A);
    seqnum_A_start = 1;
    seqnum_A_total = 1;
    seqnum_A_next = 1;
}
