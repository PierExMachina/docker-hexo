![](https://raw.githubusercontent.com/hexojs/awesome-hexo/master/hexo-logo.png)

## Tag available
* latest [(Dockerfile)](https://github.com/pierexmachina/docker-hexo/blob/master/Dockerfile)

## Description
A fast, simple & powerful blog framework, powered by [Node.js](http://nodejs.org).
Based on node.js docker image for arm.  
Tested only on Raspberry Pi 3.  
Based on davyy hexo docker image https://github.com/davyyy/docker-hexo  

## docker hub
[https://hub.docker.com/r/pierexmachina/hexo/] (https://hub.docker.com/r/pierexmachina/hexo/)

## Build Image

```shell
docker build -t pierexmachina/hexo .
```

## Quick Start

You can use this image just like the `hexo-cli`, for example:

```
docker run --rm pierexmachina/hexo help
```

The commands `hexo init` and `npm install` already ran when built the docker image,
so you don't have to download anything to start.


### Start the server

```
docker run --name hexo-server -d -p YOURPORT:4000 -v /YOUR/BLOG/PATH/:/blog  pierexmachina/hexo server
```

Notes:

- name the container, because we will use it later in `volumes-from`.
- we start the server here, so run in background with `-d` option.
- choose a port you want to expose
- choose a local directory for your blogs

The `/YOUR/BLOG/PATH/` shoud be empty(or not exists) when first run container from this image.
If the directory is empty, it will copy all init files from the image to the volume, otherwise do **nothing**.
And you can run `hexo init` command by yourself if you like, of course.

### New post

```
docker run --rm --volumes-from hexo-server pierexmachina/hexo new foo
INFO  Created: /blog/source/_posts/foo.md
```

Then you can write your post with your favorite editer, for example:

```
  vim /YOUR/BLOG/PATH/source/_posts/foo.md
```

Just remember:

- we don't need keep this container, so don't forget to use the `--rm` option to remove it automatically.
- use `--volumes-from` to mount from our earlier created blog volume, otherwise it will create a new volume with initial hexo.

### Generate static files:

```
docker run --rm --volumes-from hexo-server pierexmachina/hexo gen
```

### Deploy
```
docker run --rm --volumes-from hexo-server pierexmachina/hexo deploy
```

