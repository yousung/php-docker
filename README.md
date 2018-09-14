# Php Docker

### Setting
`폴더구조는 다른 웹서비스와 같은 Level에 놓습니다.`
- root
    - web service 1
    - web service 2
    - web service 3
    - web service 4
    - docker-laravel

```
$ git clone https://github.com/yousung/docker-laravel
$ cd docker-laravel
$ cp .env.example .env
$ docker-compose up -d // or docker-compose php redis

// option
- docker-compose up -d [option]
    - php           [필수]
    - mysql         [필수]
    - redis         [선택]
    - memcached     [선택]
    - phpmyadmin    [선택]

- 생략시 모두 실행
```

### Basic Info
```
mysql DB root id : root
mysql DB root pw : root
mysql DB laravel id : homestead
mysql DB laravel pw : secret
```

### History
```
2018.09.13 : laravel 5.7 필수사양으로 PHP image 변경
2018.09.14 : PHP>config php bash 시 홈디렉토리 항목들 link
```

라이센스 : MIT