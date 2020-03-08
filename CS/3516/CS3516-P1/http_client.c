#include <stdio.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <sys/time.h>
#include <string.h>
#include <unistd.h>
#include <string.h>
#include <netdb.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <limits.h>
#include <libgen.h>
#include <errno.h>

#define FALSE 0
#define TRUE 1
#define RCVBUFSIZE 1024

int main(int argc, char *argv[]) { // $ ./http_client [-options] server_url port_number
	if(argc < 3) {
		printf("Usage: ./http_client [-options] server_url port_number\n");
		return EXIT_SUCCESS;
	}

	char *host = (char *)malloc(sizeof(char) * 256);
	char *server_url = (char *)malloc(sizeof(char) * 2048);
	char *port = (char *)malloc(sizeof(char) * 2);
	char *file = (char *)malloc(sizeof(char) * 2048);
	int rtt = FALSE;
	if(argc == 3) {
		server_url = argv[1];
		port = argv[2];
	}
	if(argc == 4) {
		rtt = TRUE;
		server_url = argv[2];
		port = argv[3];
	}

	char *file1 = strstr(server_url, "/");
	if(file1 == NULL) {
		strcpy(file, "/");
		strcpy(host, server_url);
	}
	else {
		strcpy(file, file1);
		file += 1;
		strcpy(host, strtok(server_url, "/"));
	}
	
	// Resolve DNS
	struct addrinfo hints, *res;
	memset(&hints, 0, sizeof(hints));
	hints.ai_family = AF_INET;
	hints.ai_socktype = SOCK_STREAM;
	int error;
	if((error = getaddrinfo(host, port, &hints, &res)) != 0) {
		printf("Error Resolving DNS.\n");
		return EXIT_FAILURE;
	}

	// Create Socket
	int sd;
	if((sd = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0) {
		printf("Socket Call Error.\n");
		return EXIT_FAILURE;
	}

	// Enable timeout	
	struct timeval to;
	to.tv_sec = 0;
	to.tv_usec = 500000;
	if(setsockopt(sd, SOL_SOCKET, SO_RCVTIMEO, (char *)&to, sizeof(to)) != 0) {
		printf("Error setting socket options: %d.\n", errno);
		return EXIT_FAILURE;
	}

	// RTT Calculation
	struct timeval *tv_before = (struct timeval *)malloc(sizeof(struct timeval));
	struct timeval *tv_after = (struct timeval *)malloc(sizeof(struct timeval));
	if(rtt) {
		if(gettimeofday(tv_before, NULL) == -1) {
			printf("Error getting time before connect.\n");
			return EXIT_FAILURE;
		}
	}

	// Connect to server
	if(connect(sd, res->ai_addr, res->ai_addrlen) < 0) {
		printf("Error Connecting to Socket.\n");
		return EXIT_FAILURE;
	}

	// RTT Part 2
	if(rtt) {
		if(gettimeofday(tv_after, NULL) == -1) {
			printf("Error getting time after connect.\n");
			return EXIT_FAILURE;
		}
	}

	// Write data
	char *m = "GET %s HTTP/1.1\r\n"; // add another \r\n pair for HTTP/1.0
	char message[256];
	if(strcmp(file, server_url) == 0) {
		sprintf(message, m, "/");
	}
	else {
		sprintf(message, m, file);
	}

	char *host_message = "Host: %s\r\n\r\n";
	char message2[128];
	sprintf(message2, host_message, host);
	strcat(message, message2);

	int bytes_to_send = strlen(message);
	int bytes_sent = 0;
	do {
		int bytes = send(sd, message + bytes_sent, bytes_to_send - bytes_sent, 0);
		if(bytes < 0) {
			printf("Error Writing to Socket.\n");
			return EXIT_FAILURE;
		}
		if(bytes == 0) {
			break;
		}
		bytes_sent += bytes;
	} while (bytes_sent < bytes_to_send);
	
	// Read data
	char *response = (char *)malloc(sizeof(char) * INT_MAX);
	char data[1024];
	int bytes_received = 0;
	while((bytes_received = recv(sd, data, 1023, 0)) > 0) {
		if(bytes_received < 0) {
			printf("Error Receiving Data.\n");
			return EXIT_FAILURE;
		}
		else if(bytes_received == 0) {	}
		else {
			strncat(response, data, bytes_received);
		}
	}
	close(sd);	
	char *parts = (char *)malloc(sizeof(char) * INT_MAX);
	char *temp1;
	char *str = (char *)malloc(sizeof(char) * INT_MAX);
	strcpy(str, response);
	int acc = 0;
	while((temp1 = strtok(str, "\r\n")) != NULL) {
		if(strstr(temp1, "<html") != NULL || strstr(temp1, "<HTML") != NULL || strstr(temp1, "<!doctype") != NULL || strstr(temp1, "<!DOCTYPE") != NULL) {
			break;
		}
		strcat(parts, temp1);
		strcat(parts, "\r\n");
		if(acc == 0) {
			str = NULL;
		}
		acc++;
	}

	printf("%s\n", parts);

	// RTT Part 3
	if(rtt) {
		printf("Round trip time: %f ms.\n", (tv_after->tv_usec - tv_before->tv_usec) / 1000.0);
	}

	char *body = strstr(response, "\r\n\r\n");
	if(body != NULL) {
		body += 4;
		char f[64];
		if(strcmp(file, "/") == 0) {
			strcpy(f, host);
		}
		else {
			strcpy(f, file);
		}
		FILE *fd = fopen(f, "w");
		if(fd == NULL) {
			printf("Error opening file.\n");
			return EXIT_FAILURE;
		}
		fprintf(fd, "%s", body);
		fclose(fd);
	}
	return EXIT_SUCCESS;
}
