from argparse import ArgumentParser
from socket import socket

EOT = b'\x04'


# FUNC
def read(filename: str):
    with open(filename) as file:
        return file.read()


# Args(port....)
parser = ArgumentParser('client')
parser.add_argument('--host', '-H', help='host to connect to (IP address or hostname)', type=str, default='localhost')
parser.add_argument('--port', '-p', help='port to connect to on the host', type=int, default=3000)
parser.add_argument('--text', '-t', help='text to send to the server', type=str)
parser.add_argument('--file', '-f', help='file from which to send text', type=str)
args = parser.parse_args()

# check -t -f erorr
assert not args.text or not args.host or not args.file
packet = read(args.file) if args.file else (args.text or input('Enter some text: '))

# Connect to server
s = socket()
per_addr = (args.host, args.port)
s.connect(per_addr)  # connect to server soket (IP,PORT)-server
s.sendall(packet.encode())
s.send(EOT)
res = s.recv(1024).decode()  # 1024 best practice
while res:
    print(res, end='')
    res = s.recv(1024).decode()

