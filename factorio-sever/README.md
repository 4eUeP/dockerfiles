factorio-sever
==============

## Getting started

An example to run this image:

```sh
mkdir -p ~/games/factorio/saves

# preparing map & config
# cp /path/to/your/saves/default.zip ~/games/factorio/saves/default.zip
# cp /path/to/your/server-config.json ~/games/factorio/server-settings.json

podman run -td --name some-factorio \
    -v ~/games/factorio/saves:/opt/factorio/saves \
    -v ~/games/factorio/server-settings.json:/opt/factorio/server-settings.json \
    -p 5057:34197/udp \
    laxcat/factorio factorio --start-server /opt/factorio/saves/default.zip --server-settings /opt/factorio/server-settings.json
```


## Update Image

- Download latest headless package from <https://factorio.com/get-download/stable/headless/linux64>, put it to `files`.
- Check `VERSION` in dockerfile matchs the download.
- Run `docker build . -t laxcat/factorio`
