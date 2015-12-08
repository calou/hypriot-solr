## Building image
    docker build -t calou/hypriot-solr . 

## Starting container
    docker run -d -p 8983:8983 --name=solr --restart=always calou/hypriot-solr
