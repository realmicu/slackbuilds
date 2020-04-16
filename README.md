# SlackBuilds Repository

This is my build system for Slackware Linux x86-64. It allows to build from source some useful packages, extra ones that are not in official repository. For more visit https://slackbuilds.org/
Compressed sources are not included here, please run `get_sources.sh` script to download each of them before building a package.

Quick guide:

    cd dir/package
    ./get_sources.sh
    su root
    ./package.SlackBuild

SlackBuild script accepts `--cleanup` parameter that removes all intermediate directories in */tmp* (sources, package tree etc) created during packaging.

*BUILD_ORDER* file lists all packages in order that satisfies dependencies when building packages one by one.

By default, package name contains `micu` suffix appended to build number. To exclude packages from *slackpkg* processing (for example automatic removal when using `clean-system` subcommand), add following line to */etc/slackpkg/blacklist* :

    [0-9]+micu

