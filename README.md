# pyinstaller-windows

This is a fork of [**cdrx/pyinstaller-windows**](https://hub.docker.com/r/cdrx/pyinstaller-windows), with the following changes:

- change Ubuntu base images from 12.04/14.04/16.04 to 18.04/20.04
- change PyInstaller version from 3.6 to 4.0 for Python 3
- change to _latest_ Python 3.7.X and 2.7.X releases (as of October 4<sup>th</sup>, 2020)
- change OpenSSL from 1.0.2 to 1.1.1
- change `winetricks win7` to `winetricks win10`
- change `WINE_VERSION=winehq-staging` to `WINE_VERSION=winehq-stable`
- other minor modifications

----

[**engineervix/pyinstaller-windows**](https://hub.docker.com/r/engineervix/pyinstaller-windows) is a Docker container to ease compiling Python applications to Windows `.exe` files.

Current PyInstaller version used: 3.6 (this is the last PyInstaller version to support Python 2.7).

## Tags

[`engineervix/pyinstaller-windows`](https://hub.docker.com/r/engineervix/pyinstaller-windows) has three tags; `:python3`, `:python3-32bit` and `:python2` which you can use depending on the requirements of your project. `:latest` points to `:python3`

The `:python2` tag runs Python 2.7.

The `:python3` and `:python3-32bit` tags run Python 3.7.

## Usage

This container runs Wine inside Ubuntu to "emulate" Windows in Docker.

To build your application, you need to mount your source code into the `/src/` volume.

The source code directory should have your `.spec` file that PyInstaller generates. If you don't have one, you'll need to run PyInstaller once locally to generate it.

If the `src` folder has a `requirements.txt` file, the packages will be installed into the environment before PyInstaller runs.

For example, in the folder that has your source code, `.spec` file and `requirements.txt`:

```
docker run -v "$(pwd):/src/" engineervix/pyinstaller-windows
```

will build your PyInstaller project into `dist/windows/`. The `.exe` file will have the same name as your `.spec` file.

### How do I install system libraries or dependencies that my Python packages need?

You'll need to supply a custom command to Docker to install system pacakges. Something like:

```
docker run -v "$(pwd):/src/" --entrypoint /bin/sh engineervix/pyinstaller-linux -c "apt-get update -y && apt-get install -y wget && /entrypoint.sh"
```

Replace `wget` with the dependencies / package(s) you need to install.

### How do I generate a .spec file?

`docker run -v "$(pwd):/src/" engineervix/pyinstaller-windows "pyinstaller your-script.py"`

will generate a `spec` file for `your-script.py` in your current working directory. See the PyInstaller docs for more information.

### How do I change the PyInstaller version used?

Add `pyinstaller=X.Y.Z` to your `requirements.txt` (where `X.Y.Z` represents the version).

### Is it possible to use a package mirror?

Yes, by supplying the `PYPI_URL` and `PYPI_INDEX_URL` environment variables that point to your PyPi mirror.

## Known Issues

You tell me!

<!-- ## History

#### [1.9] - 2020-01-14
Added a 32bit package, thank you @danielguardicore
Updated PyInstaller to version 3.6

#### [1.8] - 2019-01-15
Build using an older version of glibc to improve compatibility, thank you @itouch5000
Updated PyInstaller to version 3.4

#### [1.7] - 2018-10-02
Bumped Python version to 3.6 on Linux, thank you @itouch5000

#### [1.6] - 2017-11-06
Added Python 3.6 on Windows, thanks to @jameshilliard

#### [1.5] - 2017-09-29
Changed the default PyInstaller version to 3.3

#### [1.4] - 2017-01-26
Fixed bug with concatenated commands in entrypoint arguments, thanks to @alph4

#### [1.3] - 2017-01-23
Upgraded PyInstaller to version 3.2.1.
Thanks to @bmustiata for contributing:
 - Custom PyPi URLs
 - No longer need to supply a requirements.txt file if your project doesn't need it
 - PyInstaller can be called directly, for e.g to generate a spec file

#### [1.2] - 2016-12-13
Added Python 3.5 on Windows, thanks (again) to @bmustiata

#### [1.1] - 2016-12-13
Added Python 3.4 on Windows, thanks to @bmustiata

#### [1.0] - 2016-08-26
First release, works. -->

## License

MIT

---
