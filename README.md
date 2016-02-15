# docker-plexhometheatre
Plex Home Theater Docker Image

## Prerequisites
* x-server installed on host OS
* Nvidia proprietary graphics drivers installed on host OS (only card supported atm)

## Usage
```
docker run -v /tmp:/tmp -v <path of config>:/root/.plexht --name=plexhometheater nicjo814/docker-plexhometheater
```

**Parameters**
* `-v /config` - config files for Plex Home Theater
