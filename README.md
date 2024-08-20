# Docker-ProjectCars-DS

Dockerized SteamCMD server to download and run the Project Cars Dedicated Server

[![](https://img.shields.io/codacy/grade/e201fa6b35074864b200eaf558563a22.svg)](https://hub.docker.com/r/InfiniteFlame/docker-projectcars-ds) [![Docker Cloud Build Status](https://img.shields.io/docker/automated/infiniteflame/docker-projectcars-ds.svg)](https://hub.docker.com/r/infiniteflame/docker-projectcars-ds/) [![Docker Stars](https://img.shields.io/docker/stars/infiniteflame/docker-projectcars-ds.svg)](https://hub.docker.com/r/infiniteflame/docker-projectcars-ds/) [![Docker Pulls](https://img.shields.io/docker/pulls/infiniteflame/docker-projectcars-ds.svg)](https://hub.docker.com/r/infiniteflame/docker-projectcars-ds/) [![](https://img.shields.io/docker/image-size/infiniteflame/docker-projectcars-ds)](https://img.shields.io/docker/image-size/infiniteflame/docker-projectcars-ds)

# Supported tags and respective `Dockerfile` links

- [`latest` (*/Dockerfile*)](https://github.com/InfiniteFlame15/Docker-ProjectCars-DS/blob/main/Dockerfile)

# What is Project CARS?

Project CARS is a racing sim that features world-class graphics and handling, a ground-breaking dynamic time of day & weather system, and deep tuning & pit stop functionality, players can create a driver, pick from a variety of motorsports, and shift into high gear to chase a number of Historic Goals in a quest to enter the Hall Of Fame.<br/>
This Docker image contains the dedicated server of the game.

> [Project CARS](https://store.steampowered.com/app/234630/Project_CARS/)

<img src="https://2w8jl122n7y91l5olr1w56xb-wpengine.netdna-ssl.com/two/wp-content/uploads/sites/4/2017/11/ProjectCARS_Official_Logo.png" alt="logo" width="300"/></img>

# How to use this image

## Hosting a simple game server

Running on the *host* interface (recommended):<br/>

```console
docker run -d --net=host --name=pcars-dedicated infiniteflame/docker-projectcars-ds
```

Running using a bind mount for data persistence on container recreation:

```console
mkdir -p $(pwd)/pcars-data
chmod 777 $(pwd)/pcars-data # Makes sure the directory is writeable by the unprivileged container user
docker run -d --net=host -v $(pwd)/pcars-data:/home/steam/pcars_ds/ --name=pcars-dedicated infiniteflame/docker-projectcars-ds
```

Running using specific ports:

```console
$ docker run -d \
    -p 8766:8766 \
    -p 8766:8766/udp \
    -p 27015:27015 \
    -p 27015:27015/udp \
    -p 27016:27016 \
    -p 27016:27016/udp \
    -p 9000:9000 \
    -name=pcars-dedicated \
    infiniteflame/docker-projectcars-ds
```

You **MUST** forward the following ports in your router for both TCP and UDP traffic to have others join your server.<br/>
**27015, 27016, 8766**<br/>
You can use the following [website](https://portforward.com/router.htm) to find out how to port forward on your router.

**It's also recommended to use "--cpuset-cpus=" to limit the game server to a specific core & thread.**<br/>
**The container will automatically update the game on startup, so if there is a game update just restart the container.**

# Configuration

## Environment Variables

Feel free to overwrite these environment variables, using -e (--env):

```dockerfile
STEAMAPPID=332670
STEAMAPPDIR=/home/steam/pcars_ds
```

## Config

The image contains a copy of a custom config file from [here](https://github.com/InfiniteFlame15/Docker-ProjectCars-DS/blob/main/server.cfg). You can edit the config using this command:

```console
docker exec -it pcars-dedicated nano /home/steam/pcars_ds/server.cfg
```

If you want to learn more about configuring a Project CARS server check out this [documentation](https://forum.projectcarsgame.com/showthread.php?22370-Dedicated-Server-HowTo-(Work-in-Progress)).

# Contributors

[![Contributors Display](https://badges.pufler.dev/contributors/InfiniteFlame/docker-projectcars-ds?size=50&padding=5&bots=false)](https://github.com/InfiniteFlame15/Docker-ProjectCars-DS/graphs/contributors)
