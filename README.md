# Remote Testing

To help raise the quality of your code, Microsoft introduced a way to run [Remote Testing in Visual Studio](https://learn.microsoft.com/en-us/visualstudio/test/remote-testing?view=vs-2022) where you can add all sorts of environments.

Since all code starts out locally, it is nice to verify tests manually before pushing to CI/CD flows - especially because there more often than expected are differences between Windows, Linux and even WSL (even if they use the same distro).

For this reason, consider adding a `testenvironments.json` to the root of your repository and add this snippet to it:

## .NET 8.0.407 and 9.0.202

```json
{
    "version": "1",
    "environments": [
        {
            "name": "WSL-Ubuntu",
            "type": "wsl",
            "wslDistribution": "Ubuntu-24.04"
        },
        {
            "name": "Docker-Ubuntu",
            "type": "docker",
            "dockerImage": "gimlichael/ubuntu-testrunner:net8.0.407-9.0.202"
        }
    ]
}
```

## Mono, .NET 8.0.407 and 9.0.202

```json
{
    "version": "1",
    "environments": [
        {
            "name": "WSL-Ubuntu",
            "type": "wsl",
            "wslDistribution": "Ubuntu-24.04"
        },
        {
            "name": "Docker-Ubuntu",
            "type": "docker",
            "dockerImage": "gimlichael/ubuntu-testrunner:mono-net8.0.407-9.0.202"
        }
    ]
}
```

You can find populated Docker images under my account: https://hub.docker.com/r/gimlichael/ubuntu-testrunner/tags or build your own from the embedded [Dockerfile](./Dockerfile).

Happy testing!