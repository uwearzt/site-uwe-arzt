+++
title = "Docker Quick Tips"
date  = "2017-01-05"
type = "page"
+++

| command                                               | description                                       |
|-------------------------------------------------------|---------------------------------------------------|
| docker rm $(docker ps -q -f status=exited)            | Remove all exited containers                      |
| docker rmi $(docker images --filter dangling=true -q) | Remove all unused images                          |
