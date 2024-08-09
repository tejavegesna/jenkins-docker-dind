# jenkins-docker-dind
Jenkins Docker inside Docker

```
docker compose up -d && docker compose logs -f
```

### Get Current Plugin Versions from Jenkins 

[http://localhost:8080/script](http://localhost:8080/script)

```
import jenkins.model.*

def pluginManager = Jenkins.instance.pluginManager

pluginManager.plugins.each { pluginWrapper ->
    def pluginId = pluginWrapper.getShortName()
    def pluginVersion = pluginWrapper.getVersion()

    println("$pluginId: $pluginVersion")
}
```

### Upgrades to New Images 

1. Docker Compose up with new base image in Dockerfile
2. Update Plugins as needed
    http://localhost:8080/manage/pluginManager/
3. Run Get Plugins version after Jenkins Restart from script console
4. Update & Commit file
