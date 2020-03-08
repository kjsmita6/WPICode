#include <stdio.h>
#include <stdlib.h>
#include "node.h"

extern int TraceLevel;
extern float clocktime;

void rtinit(int node, struct distance_table *dt, struct NeighborCosts *neighbor,
    void (*print_func)(int node, struct NeighborCosts *neighbor, struct distance_table *dt)) {
    int i, j;
    for(i = 0; i < MAX_NODES; i++) {
        for(j = 0; j < MAX_NODES; j++) {
            dt->costs[i][j] = INFINITY;
        }
    }

    int costs[MAX_NODES];
    neighbor = getNeighborCosts(node);
    for(i = 0; i < neighbor->NodesInNetwork; i++) {
        dt->costs[i][i] = neighbor->NodeCosts[i];
        costs[i] = neighbor->NodeCosts[i];
    }

    printf("At time t=%f, rtinit%d() called.\n", clocktime, node);
    print_func(node, neighbor, dt);
    send_to_network(node, costs, dt, neighbor);
}


void rtupdate(int node, struct RoutePacket *rcvdpkt, struct distance_table *dt, struct NeighborCosts *neighbor,
    void (*print_func)(int node, struct NeighborCosts *neighbor, struct distance_table *dt)) {
    int sourceid = rcvdpkt->sourceid;
    int updated = 0;
    int i;
    for(i = 0; i < MAX_NODES; i++) {
        int current_cost = dt->costs[sourceid][sourceid] + rcvdpkt->mincost[i];
        int old_cost = dt->costs[i][sourceid];
        if(current_cost < old_cost) {
            dt->costs[i][sourceid] = current_cost;
            updated = 1;
        }
    }

    if(updated == 1) {
        neighbor = getNeighborCosts(node);
        print_func(node, neighbor, dt);

        int costs[MAX_NODES];
        for(i = 0; i < neighbor->NodesInNetwork; i++) {
            costs[i] = neighbor->NodeCosts[i];
        }
        send_to_network(node, costs, dt, neighbor);
    }

    printf("At time t=%f, rtupdate%d() called.\n", clocktime, node);
}

void send_to_network(int node, int costs[], struct distance_table *dt, struct NeighborCosts *neighbor) {
    int i, j, k;
    for(i = 0; i < neighbor->NodesInNetwork; i++) {
        if(i == node || costs[i] == INFINITY) {
            continue;
        }

        printf("At time t=%f, node %d sends packet to node %d with:", clocktime, node, i);

        struct RoutePacket *pkt = (struct RoutePacket *)malloc(sizeof(struct RoutePacket));
        pkt->sourceid = node;
        pkt->destid = i;

        for(j = 0; j < MAX_NODES; j++) {
            int min = INFINITY;
            for(k = 0; k < MAX_NODES; k++) {
                int temp = dt->costs[j][k];
                if(temp < min) {
                    min = temp;
                }
            }
            printf(" %d", min);
            pkt->mincost[j] = min;
        }
        printf("\n");
        toLayer2(*pkt);
    }
}

