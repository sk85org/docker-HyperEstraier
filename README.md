# docker-HyperEstraier
## docker-HyperEstraierとは
docker-HyperEstraierを使うことでDockerコンテナ上で[Hyper Estraier](https://dbmx.net/hyperestraier/)を用いた全文検索システムが迅速に構築できます。

## 使い方
### 初期設定
#### docker-compose.yml
docker-HyperEstraierはGUIを担当するコンテナ(app)と文章の登録を担当するコンテナ(estcmd)に分かれています。docker-compose.ymlのestcmd下にある./sourceに検索したいフォルダを指定してください。
```
version: '3.3'

services:
  app:
    depends_on:
      - estcmd 
    build: ./lighttpd
    volumes:
      - ./index:/index
      - ./lighttpd/configuration:/configuration
      - ./lighttpd/startscript:/startscript
    ports: 
     - 80:80
    restart: always
    networks:
      - default
  estcmd:
    build: ./estcmd
    #restart: always
    #command: gather -sd /index /source
    volumes:
      - ./index:/index
      - ./source:/source
      - ./estcmd/startscript:/startscript
      - ./estcmd/cron_configuration:/cron_configuration
    networks:
      - default
```

### 起動
```
docker-compose up -d
```
[localhost:80](http://localhost:80)でコンテナが起動します。  
デフォルト設定ではUTC時間で毎日0時に新しく追加されたファイルがインデックスに登録されます。またUTC時間で毎日3時に削除されたファイルがインデックスから取り除かれます。