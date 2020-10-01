# Wand

An extendable cli for developers who work with multi-repo application. 

## About

WAND is an extendable cli which is compose for a set of out-of-the-box plugins (aka: spells)  to speed-up the developers working with multi components/microservices applications.

WAND is concentrated to facilitate the developers burden while working with multiples repositories for an application

>We discourage the use of monorepos and prefer independent repositories per component.

## Get started

##### Start by installing WAND.

```sh
npm i -g @chimpwizards/wand
```

##### Check the cli available commands and instructions how to use it

```sh
w --help
```
.. or check the list of available commands [here](docs/COMMANDS.md)

##### Then create your new application workspace

```sh
w new workspace helloworld \
    --organization git@github.com:ACME
cd helloworld
code .
```

##### Then add your application components/dependency/microservices

```sh
w new dependency contacts
```

#### Next steps

Build a hello world application step by step guide [here](docs/HELLOWORLD.md)
