# EPASWMM

Base docker image for running EPASWMM simulations.

## Usage

Pull the image:tag down with the EPASWMM version you want to use.

_See https://hub.docker.com/r/neerteam/epaswmm/tags?page=1&ordering=last_updated for a list of available tags._

```sh
docker pull neerteam/epaswmm:5.1.15
```

Next, use it as a base image for your application with the specific version you want:
```dockerfile
FROM neerteam/epaswmm:5.1.15

# Setup the rest of your image
# ...

# EPASWMM can be found in /usr/local/bin
# and is exposed in the system PATH
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
