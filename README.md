# python-webapp

A Docker-based deployment of a Python webapp with Nginx and Gunicorn. Based on a tutorial at
http://pawamoy.github.io/2018/02/01/docker-compose-django-postgres-nginx.html

Launch the app with the command

```console
docker-compose up
```

and navigate to `localhost:8000` in your browser.

## Overview

This is a prototype of a full deployment for a Django project. The services are deployed with
`docker-compose` and consist of the following containers:

- *nginx* Proxies requests to Gunicorn and serves static files
- *Gunicorn + Django* WSGI server plus the web application itself
- *Postgresql* The database

### Network configuration

The Gunicorn/Django container is connected to the database and Nginx networks via a bridge. The
database container is not accessible from the host.

### Static files

Nginx serves the static files. Before launching the stack, you can collect static files with the
command:

```console
docker-compose run webapp ./manage.py collectstatic --no-input
```
