# Server return upper text back to client

## Run server by:

```bash
python3 socket_server
```
> By default host=localHost and port=3000

### arguments server:
- -H, --host 
- -p, --port


## Connect to the server:

```bash
python3 socket_client -h localHost -p 3000
```

### arguments client:
- -H, --host -> servers hostname
- -p, --port -> servers port
- -t, --text -> send text to sever ""
- -f, --file -> send file to sever