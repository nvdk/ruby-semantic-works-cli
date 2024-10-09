# ruby-semantic-works-cli

Provides a base docker image to be used in [mu cli](https://github.com/mu-semtech/mu-cli) scripts. 
The main benefit over using the base ruby image is not having to install the dependencies each time the script is ran. See the [Gemfile](Gemfile) for which depencies this adds.


## Usage for project scripts

Add the simple script store to your `docker-compose.yml` file:

```yaml

  project-scripts:
    image: semtech/simple-script-store:1.0.0
    volumes:
      - ./scripts/:/app/scripts/
    restart: "no"
```

Under `./scripts/config.json` use this image as your basis:

```json
{
  "version": "0.1",
  "scripts": [
    {
      "documentation": {
        "command": "create-export",
        "description": "create export of administrative units and their bodies",
        "arguments": []
      },
      "environment": {
        "image": "nvdk/ruby-semantic-works-cli",
        "interactive": true,
        "script": "export/run.rb",
        "join_networks": true
      },
      "mounts": {
        "app": "/project/"
      }
    }
  ]
}
```

