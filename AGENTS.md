# AGENTS.md

## Cursor Cloud specific instructions

### Project overview

Docker-ProjectCars-DS is a Dockerized SteamCMD game server for Project CARS. The entire product is a Docker image built from 3 source files: `Dockerfile`, `start.sh`, and `server.cfg`. There are no programming-language package managers, databases, or frameworks — just Docker and Bash.

### Building and running

- **Build:** `docker build -t docker-projectcars-ds .`
- **Run:** `docker run -d --net=host --name=pcars-dedicated docker-projectcars-ds`
- See `README.md` for full usage and port-forwarding details.

### Docker-in-Docker setup (Cloud VM)

This environment runs inside a container, so Docker needs special configuration:
- Storage driver must be `fuse-overlayfs` (set via `/etc/docker/daemon.json`).
- iptables must use the legacy backend (`update-alternatives --set iptables /usr/sbin/iptables-legacy`).
- The Docker daemon must be started manually: `sudo dockerd &>/tmp/dockerd.log &`
- After starting dockerd, ensure the socket is accessible: `sudo chmod 666 /var/run/docker.sock`

### Gotchas

- `start.sh` must have the executable bit set (`chmod +x start.sh`). Git may strip it; re-set before building.
- SteamCMD may emit a warning "Please use force_install_dir before logon!" — this is a cosmetic warning in current SteamCMD versions; the app still installs successfully at container runtime.
- The Lua addon config warnings (e.g. "Failed to read addon config from 'lua/sms_base/sms_base.json'") are expected on first run before the addons create their config files.
- The game server's HTTP API is available at port 9000 inside the container. Useful endpoints for verification: `/api/version`, `/api/session/status`, `/api/help`.

### Linting / Testing

There are no automated test suites or linters. The `Jenkinsfile` defines a basic CI smoke test that runs SteamCMD info commands. To validate changes, build the Docker image and verify the container starts and the HTTP API responds.
