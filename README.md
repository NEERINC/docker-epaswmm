# docker-epaswmm

Docker image for running EPASWMM simulations.

## Usage

Pull the image:tag down with the EPASWMM version you want to use.

_See https://hub.docker.com/r/neerteam/epaswmm/tags?page=1&ordering=last_updated for a list of available tags._

```sh
docker pull neerteam/epaswmm:5.1.15
```

Next, run the image as a new container with the environment variable `INP_FILE_URL` passed in.

```sh
docker run --name my-epaswmm-simulation -e INP_FILE_URL=http://example.com/my-inp-file neerteam/epaswmm:5.1.15
```

When the simulation completes (assuming there were no errors), your _.rpt_ and _.out_ files will be accessible from within the container in the **/epaswmm** directory as **epaswmm.rpt** and **epaswmm.out**.

```sh
docker cp my-epaswmm-simulation:/epaswmm/epaswmm.rpt .
docker cp my-epaswmm-simulation:/epaswmm/epaswmm.out .
```

## Roadmap

See the [open issues](https://github.com/NEERINC/docker-epaswmm/issues) for a list of proposed features (and known issues).

## Contributing

Contributions are always welcome and highly appreciated! Please read through our [code of conduct](.github/CODE_OF_CONDUCT.md) first.

1. Fork the project
2. Create your bugfix/feature branch
```sh
git checkout -b {bugfix/feature}/my-bugfix-or-feature
```
3. Add, commit, and push your changes with a meaningful message
```sh
git add . && git commit -m "Changed X,Y,Z" && git push
```
4. Open a pull request with our repository's _main_ branch

## License

Distributed under the GPL-3.0 License. See [LICENSE](./LICENSE) for more information.
