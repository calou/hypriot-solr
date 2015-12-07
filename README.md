## Building image
    docker build -t calou/hypriot-solr . 

##ÂStarting container
    docker run -d -p 8393:8393 --name=solr --restart=always calou/hypriot-solr
