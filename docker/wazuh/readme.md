# Wazuh Docker-Compose Containers guide

<p align="center">
<img src="https://github.com/Joska99/joska/blob/main/docker/docker-compose/wazuh/diagram.drawio.svg">
</p>

<h2> Steps: </h2>

1. Clone Wazuh repository:

```bash
git clone https://github.com/wazuh/wazuh-docker.git
```

2. Go to "single-node" directory:

```bash
cd wazuh-docker/single-node
```

3. Run the certificate creation script:

```bash
sudo docker compose -f generate-indexer-certs.yml run --rm generator
```

4. Run to start:

```bash
sudo docker compose up -d
```

> -d - on background

5. Access the UI https://localhost:443
> Login: admin </br>
> Password: SecretPassword

<h2> Add agent to monitor: </h2>

1. Click on "Add agent" or DropDown menu -> Agents

- Chose target OS, configure version and architecture

  > windows config file: C:\Program Files (x86)\ossec-agent\ossec.conf </br>
  > linux config file: //var/ossec/etc/ossec.conf

- Add Wazuh server address
  > run from terminal to check IP where Wazuh installed:

```bash
hostname -I
```

- Install and Start agent on target by command provides on the bottom

<h2> Enable vulnerability-detector: </h2>

1. Go to "Management" -> "Configurations" -> "Edit"
2. Search for 'vulnerability-detector' in "enabled" change 'no' to 'yes'

```
 <vulnerability-detector>
    <enabled>yes</enabled>
    <interval>5m</interval>
    <min_full_scan_interval>6h</min_full_scan_interval>
    <run_on_start>yes</run_on_start>
```

3. Restart Wazuh and check for vulnerabilities

<h2> To delete: </h2>

```Bash
sudo docker compose down
```
