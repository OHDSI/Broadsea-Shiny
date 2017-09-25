# Broadsea-Shiny [In development]
A Docker container based on rocker/shiny with added java jdk and additional R packages. The Shiny applications should be accessible on the Docker host in a sub-directory called "ShinyDeploy"  

## Configuration Options

### Override the Shiny server config file & make the access log available on the Docker host

* Optionally append the below volume mapping statements to the end of the broadsea-shiny volumes section of the docker-compose.yml file.
```
     - ./shiny-server.conf:/etc/shiny-server/shiny-server.conf
     - ./access.log:/var/log/shiny-server/access.log
```
