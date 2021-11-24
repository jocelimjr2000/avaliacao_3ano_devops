#!/bin/bash

# Create Network Project if not exists
docker network ls|grep project_network > /dev/null || docker network create --driver bridge project_network

# Create containers
docker-compose up --build -d
