sickbeard
=========

The sickbeard image runs [Sick Beard](http://sickbeard.com/) on top of the
[jleight/phusion-python](https://registry.hub.docker.com/u/jleight/phusion-python/)
container.


Usage
-----

A Sick Beard container can be started with very little extra configuration.
Here's a simple example that starts the container and opens port 8081:

```bash
$ docker run \
  --name sickbeard \
  -p 8081:8081 \
  jleight/sickbeard
```

If you want to change the Sick Beard base URL (which defaults to `/`), you can
specify a `SICKBEARD_WEBROOT` environment variable and Sick Beard will be
configured to use the specified base URL. For example, to use a base URL of
`/sickbeard`:

```bash
$ docker run \
  --name sickbeard \
  -p 8081:8081 \
  -e SICKBEARD_WEBROOT=/sickbeard \
  jleight/sickbeard
```

This container makes a few configuration assumptions that you might want to be
aware of:

- Downloaded files should be mounted into the `/var/opt/sickbeard/unsorted`
  directory.
- A directory has been created for sorted files, but you must specify that
  directory yourself when you add your first show. The directory is
  `/var/opt/sickbeard/sorted`.
- Log files are stored in the `/var/opt/sickbeard/logs` directory.
- Configuration data is stored in the `/etc/opt/sickbeard` directory.
