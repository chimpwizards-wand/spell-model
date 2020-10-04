# Commands


##### init

Initializes and installs wand core components. It gets called automatically after wand npm package gets installed, but can also be use to refresh and pull lattest updates.

```sh
w init
```

##### shell

Executes a shell command across all dependencies in the current workspace
eg. Following command executes `git status` across all dependencies including the workspace root folder.

```sh
w shell git status
```

There is also possible to execute the command just on the dependencies or just in the workscape root folder

```sh
w shell --no-dependencies git commit -am "Updates documentation"
```

Additionally some extra options to filter what type of dependencies top apply the command to, the following command runs the command just for those dependencies tagged as microservice.

```sh
w shell --tags microservice git checkout -b release/2.3
```

Commands can also be customized, additional commands can be added using `new shell` command (see below)  which will store the definition inside the wand config file. Additionally `shell` command also will look if a command is alredy defined in an existing package.json at the root of the workspce.

eg this command will run the existing sayHi command across all dependencies

```json
  "scripts": {
    "test": "",
    "build": "",
    "sayHi": "echo 'Hi'"
  },
```
```sh
w shell --verbose sayHi
```

##### new shell

Enable external shell scripts to be executed thru the wand cli, these command get registered into the .wand/config.yaml file

eg to register hello.sh run

```sh
w new shell ./scripts/hello.sh
```

then you will see this at the configuration file

```yaml
scripts:
  hello: ./scripts/hello.sh
```

After that you can call wand cli like this. and it will execute that command inside each dependency folder.

```sh
w shell hello ndru
```

##### add dependency

Adds an existing git repositoty as a dependency into the current workspace

eg:

```sh
w add git@github.com:chimpwizards-samples/sample1.git
```

##### new workspace

Create a new workspace 

```sh
w new workspace helloworld
cd helloworld
```

##### workspace clone

Clone a existing namespace and the all dependencies into the current folder

```sh
w workspace clone git@github.com:chimpwizards/wand.git
```

##### new dependency

Create a new dependency in the current workspace 

```sh
w new dependency contacts
cd dependencies/contacts
```
