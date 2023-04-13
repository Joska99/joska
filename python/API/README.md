Server retern upper text back to client

Run server by:
python3 socet_server
By default host=localHost and port=3000
Connect to the server:
python3 socet_clen -h localHost -p 3000

arguments server:
-H, --host 
-p, --port
arguments clen:
-H, --host -> servers hostname
-p, --port -> servers port
-t, --text -> send text to sever ""
-f, --file -> send file to sever