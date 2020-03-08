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

int seqnum_B_expected;

/********* STUDENTS WRITE THE NEXT SEVEN ROUTINES *********/
/*
 * The routines you will write are detailed below. As noted above,
 * such procedures in real-life would be part of the operating system,
 * and would be called by other procedures in the operating system.
 * All these routines are in layer 4.
 */
/*
 * Just like A_output, but residing on the B side.  USED only when the
 * implementation is bi-directional.
 */
void B_output(struct msg message)  {
    printf("Bi-directional messaging is not supported.\n");
    return;
}

/*
 * B_input(packet),where packet is a structure of type pkt. This routine
 * will be called whenever a packet sent from the A-side (i.e., as a result
 * of a tolayer3() being done by a A-side procedure) arrives at the B-side
 * packet is the (possibly corrupted) packet sent from the A-side.
 */
/*void B_input(struct pkt packet) {
    if(!corrupt(packet)) {
        if(packet.seqnum == seqnum_B_expected) {
            tolayer3(1, make_ack(packet.seqnum, 0));
            tolayer5(1, make_msg(packet.payload));
            seqnum_B_expected++;
        }
        else if(packet.seqnum >= seqnum_B_expected - 8) {
            tolayer3(1, make_ack(seqnum_B_expected - 1, 0));
        }
    }
}*/
void B_input(struct pkt packet) {
    if(!corrupt(packet) && packet.seqnum == seqnum_B_expected) {
        tolayer3(1, make_ack(packet.seqnum, 0));
        tolayer5(1, make_msg(packet.payload));
        seqnum_B_expected++;
    }
    else if(!corrupt(packet) && packet.seqnum >= seqnum_B_expected - 8) {
        tolayer3(1, make_ack(seqnum_B_expected - 1, 0));
    }
}

/*
 * B_timerinterrupt()  This routine will be called when B's timer expires
 * (thus generating a timer interrupt). You'll probably want to use this
 * routine to control the retransmission of packets. See starttimer()
 * and stoptimer() in the writeup for how the timer is started and stopped.
 */
void  B_timerinterrupt() {
    printf("Bi-directional messaging is not supported.\n");
    return;
}

/*
 * The following routine will be called once (only) before any other
 * entity B routines are called. You can use it to do any initialization
 */
void B_init() {
    seqnum_B_expected = 1;
}
