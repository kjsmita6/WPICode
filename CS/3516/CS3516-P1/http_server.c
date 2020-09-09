#include <stdio.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <string.h>
#include <unistd.h>
#include <string.h>
#include <netdb.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <limits.h>
#include <libgen.h>
#include <arpa/inet.h>

#define FALSE 0
#define TRUE 1

int main(int argc, const char *argv[]) {
	if(argc != 2) {
		printf("Usage: ./http_server port\n");
		return EXIT_SUCCESS;
	}

	int port = atoi(argv[1]);
	struct sockaddr_in addr_server;
	struct sockaddr_in addr_client;
	socklen_t client_length;

	// Create Socket
	int sd_server;
	int sd_client;
	if((sd_server = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0) {
		printf("Socket Call Error.\n");
		return EXIT_FAILURE;
	}


	memset(&addr_server, 0, sizeof(addr_server));
	addr_server.sin_family = AF_INET;
	addr_server.sin_addr.s_addr = htonl(INADDR_ANY);
	addr_server.sin_port = htons(port);

	// Bind to port
	if(bind(sd_server, (struct sockaddr *)&addr_server, sizeof(addr_server)) < 0) {
		printf("Failed to bind to port.\n");
		return EXIT_FAILURE;
	}


	// Listen for incoming connections
	if(listen(sd_server, 5) < 0) {
		printf("Failed to listen for connections.\n");
		return EXIT_FAILURE;
	}

	// Run forever
	while(TRUE) {
		client_length = sizeof(addr_client);
		if((sd_client = accept(sd_server, (struct sockaddr *)&addr_client, &client_length)) < 0) {
			printf("Failed to accept incoming connection.\n");
			return EXIT_FAILURE;
		}

		char request[4096];
		if(recv(sd_client, &request, sizeof(request), 0) < 0) {
			printf("Error reading request.\n");
			continue;
			//return EXIT_SUCCESS;
		}

		char *response = (char *)malloc(sizeof(char) * INT_MAX);
		char *code_400 = "HTTP/1.1 400 Bad Request\r\n\r\n";
		char *code_404 = "HTTP/1.1 404 Not Found\r\n\r\n";
		char *code_200 = "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\nContent-Length: %d\r\n\r\n";
		char *token = strtok(request, " ");
		token = strtok(NULL, " ");
		char r1[2048] = "./";
		if(token == NULL) {
			strcpy(response, code_400);
		}
		else {
			strcat(r1, token);
			FILE *fp = fopen(r1, "r");
			if(fp == NULL) {
				strcpy(response, code_404);
			}
			else {
				char *file = (char *)malloc(sizeof(char) * INT_MAX);
				char c;
				int acc = 0;
				while((c = fgetc(fp)) != EOF) {
					file[acc] = c;
					acc++;
				}
				sprintf(response, code_200, acc);
				strcat(response, file);
			}
		}


		
		int bytes_sent = 0;
		int bytes_to_send = strlen(response);
		while(bytes_sent < bytes_to_send) {
			int bytes = send(sd_client, response, bytes_to_send, 0);
			if(bytes < 0) {
				printf("Error responding to request.\n");
				return EXIT_FAILURE;
			}
			bytes_sent += bytes;
		}
		close(sd_client);

	}

	// Close socket
	close(sd_server);
}
