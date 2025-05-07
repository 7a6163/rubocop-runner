# rubocop-runner

A minimal Docker image for running RuboCop and its popular extensions in parallel with GitHub Actions annotation output.

## Features

- 🏃‍♂️ Runs RuboCop with `--parallel` for fast linting
- 📝 Outputs in GitHub Actions annotation format (`--format github`)
- 🧩 Pre-installed extensions:  
  `rubocop-rails`, `rubocop-performance`, `rubocop-rspec`, `rubocop-rspec_rails`, `rubocop-factory_bot`
- 🐳 Multi-architecture Docker image (amd64, arm64)
- ⚡ Perfect for CI/CD pipelines

## Quick Start

### Pull the Image

```bash
docker pull 7a6163/rubocop-runner:latest
```

### Run RuboCop in Your Project

```bash
docker run --rm -v $(pwd):/app 7a6163/rubocop-runner:latest
```

This will run:

```sh
bundle exec rubocop --parallel --format github
```

in your project directory.

## Example: GitHub Actions Workflow

```yaml
name: Rubocop Lint

on: [push, pull_request]

jobs:
  rubocop:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run RuboCop via Docker
        run: docker run --rm -v ${{ github.workspace }}:/app 7a6163/rubocop-runner:latest
```

## Building Locally

```bash
docker build -t rubocop-runner .
```

## Included Gems

- rubocop
- rubocop-rails
- rubocop-performance
- rubocop-rspec
- rubocop-rspec_rails
- rubocop-factory_bot

## License

[MIT License](LICENSE)
