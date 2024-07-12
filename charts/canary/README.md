# Canary helm template

## Usage

Create these files:

```yml
# Chart.yaml
name: canary
version: 0.0.1-SNAPSHOT
appVersion: 0.0.1-SNAPSHOT
```

```yml
# requirements.yaml
dependencies:
  - name: canary
    version: 0.0.1-SNAPSHOT
    repository: file://../../../../charts/canary
```

## Values

```yml
canary:
  env: dev
  application: foo
  registry: https://foo.com
  repository: foo
  tag: latest
  port: 80
```

Execute the commands:

```shell
helm dependency build
helm template ./
```

## Overriding the parameters

```shell
helm template ./\
    --set canary.env=dev\
    --set canary.application=foo\
    --set canary.repository=foo\
    --set canary.tag=latest\
    --set canary.port=80
```