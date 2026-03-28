# docker-images

Multi-branch repository of Docker images for Home Project sandbox tooling. Each image typically lives on a dedicated branch (for example `images/homeproject_example`) with its own `Dockerfile` and supporting files.

## Current images

| Image | Branch | Description |
|--------|--------|-------------|
| **homeproject_example** | `images/homeproject_example` | Minimal Python [uv](https://docs.astral.sh/uv/) image running a sample `hello-world` app |

Published builds use **Docker Hub** (see [CI workflow](.github/workflows/docker-build.yml) for the exact `image` name and tags).

## Repository layout

```
.
├── Dockerfile              # Image build (Python 3.14 slim + uv, app in hello-world/)
├── hello-world/            # Application source (uv project)
├── doc/
│   ├── README.md           # What the doc/ tree is for
│   └── images/             # Screenshots, diagrams (optional)
└── .github/workflows/      # Build and publish on push to image branches
```

Static assets referenced from this README can live under [`doc/images/`](doc/images).

## Build locally

From the repository root:

```bash
docker build -t homeproject_example:local .
```

## Run locally

```bash
docker run --rm homeproject_example:local
```

Expected output includes: `Hello from hello-world!`

## CI and registry

- **Trigger:** push to branch `images/homeproject_example` (see workflow).
- **Tags:** `stable` and `latest` (see [`docker-build.yml`](.github/workflows/docker-build.yml)).
- **Platforms:** `linux/amd64`, `linux/arm64` (multi-arch via buildx).

Configure Docker Hub credentials as repository secrets: `DOCKER_USERNAME` and `DOCKER_PASSWORD`.

### Pull published image

Replace `YOUR_DOCKERHUB_USER` with the namespace configured in the workflow:

```bash
docker pull YOUR_DOCKERHUB_USER/homeproject_example:stable
docker run --rm YOUR_DOCKERHUB_USER/homeproject_example:stable
```

## Documentation site

Long-form documentation for these images lives in the [documentation](https://github.com/HomeProjectSandbox/documentation) Docusaurus site (GitHub Pages), including a **Docker images** section that mirrors this README and holds site-local assets under `doc/project-doc/static/img/docker-images/`.

## License

Add a license file if this repository is public or shared.
