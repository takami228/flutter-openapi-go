# flutter-openapi-go

## Architecture

- Server
  - golang
- client
  - Flutter + dart client library

## how to run

### run golang server

```sh
# run server
cd ./server

# build openapigo in Docker
docker build . -t openapigo

# run openapigo in Docker
docker run -p 8080:8080 openapigo
```

### run flutter app on iOS Emulator

```sh
# run iOS emulator
open -a Simulator

# check device id to run
flutter devices list

# run client iOS emulatuer
flutter run -d ${DEVICE_ID}
```

# link

- [https://qiita.com/soichiro0311/items/287d41cdaa35bd5cff5d](https://qiita.com/soichiro0311/items/287d41cdaa35bd5cff5d)
- [http://ryuichi111std.hatenablog.com/entry/2018/11/03/214005](http://ryuichi111std.hatenablog.com/entry/2018/11/03/214005)
