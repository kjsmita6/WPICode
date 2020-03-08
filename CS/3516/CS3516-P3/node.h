#ifndef NODE_H
#define NODE_H

#include "project3.h"

struct distance_table {
    int costs[MAX_NODES][MAX_NODES];
};

void rtinit(
    int node,
    struct distance_table *dt,
    struct NeighborCosts *neighbor,
    void (*print_func)(
        int node,
        struct NeighborCosts *neighbor,
        struct distance_table *dt));
void rtupdate(
    int node,
    struct RoutePacket *rcvdpkt,
    struct distance_table *dt,
    struct NeighborCosts *neighbor,
    void (*print_func)(
        int node,
        struct NeighborCosts *neighbor,
        struct distance_table *dt));
void send_to_network(
    int node,
    int costs[],
    struct distance_table *dt,
    struct NeighborCosts *neighbor);

#endif
