#!/bin/python3

# imports modules
import os
from argparse import ArgumentParser
from multiprocessing import Process
from socket import socket
from time import sleep

# var to trigger stop
EOT = '\x04'


# read loop to handle small buffers
def read(sock: socket, bufsize: int = 1024):
    """ loop read to handle small buffer size"""
    while True:
        data = sock.recv(bufsize)
        yield data.decode().removesuffix(EOT).encode()
        if data.decode().endswith(EOT):
            break


# handle client connections
def handle_client(conn):
    """create child process for each client connection"""
    with conn:
        for data in read(conn, bufsize=128):
            sleep(0.5)
            conn.sendall(data.decode().upper().encode())


if __name__ == '__main__':
    ### Module Argparse!!!
    # arguments to CLI
    parser = ArgumentParser('server')  # argparse constructor
    # add arguments
    parser.add_argument('--host', '-H', help='IP address or hostname to bind to', type=str, default='localhost')
    parser.add_argument('--port', '-p', help='port to bind to', type=int, default=os.getenv('PORT', 3000))
    args = parser.parse_args()  # parse arguments

    # create (host, port)
    local_addr = args.host, args.port

    ### Module Socket!!!
    listen = socket()  # socket constructor
    listen.bind(local_addr)  # bind socket to HOST and PORT
    listen.listen(3)  # queue connection
    while True:
        print(f'Listening on {listen.getsockname()}...')
        conn, peer_addr = listen.accept()
        print(f'Connected to {peer_addr}.')
        ### Module Process!!!
        client_process = Process(target=handle_client, args=(conn,))  # process constructor
        client_process.start()  # start process
        conn.close()  # close connection
