# CS3515 - Project 1
Kyle Smith (kjsmith@wpi.edu)

## HTTP Client
This is a program which acts as a HTTP client to send HTTP GET requests to a web server and receive the response. Once a response is received,
the HTTP response headers will be displayed and the file received will be downloaded to the same folder. Specifying the -p option will also print
the RTT (round trip time) of the request in milliseconds.

### Running and compiling
```bash
$ make
$ ./http_client [-p] server_url port
```

## HTTP Server
Similar to the client, this program acts as an HTTP SERVER to receive HTTP GET requests and respond to them with the appropriate headers and the
requested file.

### Running and compiling
```bash
$ make
$ ./http_server port
```

To run the server as a background process, you may specify using the & symbol like so:
```bash
$ ./http_server port &
```
