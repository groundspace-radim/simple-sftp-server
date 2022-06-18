# simple-sftp-server
This is a basic SFTP server that can be used to upload files to a server or distribute files to users.

## Usage
    ./createdatadir.sh
    docker-compose up -d

The server listens on port 2222. The default username is `user`.

    sftp -P2222 user@hostname
 
## Adding users
You can add users by creating your own Dockerfile:

    FROM groundspace/simple-sftp-server:latest
    
    useradd -m -u 1002 user2
    useradd -m -u 1003 user3
    ...

## Password-based authentication
By default, simple-sftp-server relies on key-based authentication. If you would rather use a password, you can set it after starting the server:

    docker-compose exec sftp-server passwd user
