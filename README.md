About scipoptsuite-feedstock
============================

Feedstock license: [BSD-3-Clause](https://github.com/conda-forge/scipoptsuite-feedstock/blob/main/LICENSE.txt)

Home: https://scipopt.org/

Package license: Apache 2.0 AND ZIB-Academic AND LGPL-3.0-or-later

Summary: Mixed Integer Programming (MIP) solver and Branch-and-Cut-and-Price Framework

Current build status
====================


<table>
    
  <tr>
    <td>Azure</td>
    <td>
      <details>
        <summary>
          <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11841&branchName=main">
            <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/scipoptsuite-feedstock?branchName=main">
          </a>
        </summary>
        <table>
          <thead><tr><th>Variant</th><th>Status</th></tr></thead>
          <tbody><tr>
              <td>linux_64</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11841&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/scipoptsuite-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11841&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/scipoptsuite-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_64_" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_arm64</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11841&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/scipoptsuite-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_arm64_" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>win_64</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11841&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/scipoptsuite-feedstock?branchName=main&jobName=win&configuration=win%20win_64_" alt="variant">
                </a>
              </td>
            </tr>
          </tbody>
        </table>
      </details>
    </td>
  </tr>
</table>

Current release info
====================

| Name | Downloads | Version | Platforms |
| --- | --- | --- | --- |
| [![Conda Recipe](https://img.shields.io/badge/recipe-gcg-green.svg)](https://anaconda.org/conda-forge/gcg) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/gcg.svg)](https://anaconda.org/conda-forge/gcg) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/gcg.svg)](https://anaconda.org/conda-forge/gcg) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/gcg.svg)](https://anaconda.org/conda-forge/gcg) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-papilo-green.svg)](https://anaconda.org/conda-forge/papilo) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/papilo.svg)](https://anaconda.org/conda-forge/papilo) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/papilo.svg)](https://anaconda.org/conda-forge/papilo) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/papilo.svg)](https://anaconda.org/conda-forge/papilo) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-scip-green.svg)](https://anaconda.org/conda-forge/scip) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/scip.svg)](https://anaconda.org/conda-forge/scip) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/scip.svg)](https://anaconda.org/conda-forge/scip) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/scip.svg)](https://anaconda.org/conda-forge/scip) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-soplex-green.svg)](https://anaconda.org/conda-forge/soplex) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/soplex.svg)](https://anaconda.org/conda-forge/soplex) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/soplex.svg)](https://anaconda.org/conda-forge/soplex) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/soplex.svg)](https://anaconda.org/conda-forge/soplex) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-zimpl-green.svg)](https://anaconda.org/conda-forge/zimpl) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/zimpl.svg)](https://anaconda.org/conda-forge/zimpl) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/zimpl.svg)](https://anaconda.org/conda-forge/zimpl) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/zimpl.svg)](https://anaconda.org/conda-forge/zimpl) |

Installing scipoptsuite
=======================

Installing `scipoptsuite` from the `conda-forge` channel can be achieved by adding `conda-forge` to your channels with:

```
conda config --add channels conda-forge
conda config --set channel_priority strict
```

Once the `conda-forge` channel has been enabled, `gcg, papilo, scip, soplex, zimpl` can be installed with `conda`:

```
conda install gcg papilo scip soplex zimpl
```

or with `mamba`:

```
mamba install gcg papilo scip soplex zimpl
```

It is possible to list all of the versions of `gcg` available on your platform with `conda`:

```
conda search gcg --channel conda-forge
```

or with `mamba`:

```
mamba search gcg --channel conda-forge
```

Alternatively, `mamba repoquery` may provide more information:

```
# Search all versions available on your platform:
mamba repoquery search gcg --channel conda-forge

# List packages depending on `gcg`:
mamba repoquery whoneeds gcg --channel conda-forge

# List dependencies of `gcg`:
mamba repoquery depends gcg --channel conda-forge
```


About conda-forge
=================

[![Powered by
NumFOCUS](https://img.shields.io/badge/powered%20by-NumFOCUS-orange.svg?style=flat&colorA=E1523D&colorB=007D8A)](https://numfocus.org)

conda-forge is a community-led conda channel of installable packages.
In order to provide high-quality builds, the process has been automated into the
conda-forge GitHub organization. The conda-forge organization contains one repository
for each of the installable packages. Such a repository is known as a *feedstock*.

A feedstock is made up of a conda recipe (the instructions on what and how to build
the package) and the necessary configurations for automatic building using freely
available continuous integration services. Thanks to the awesome service provided by
[Azure](https://azure.microsoft.com/en-us/services/devops/), [GitHub](https://github.com/),
[CircleCI](https://circleci.com/), [AppVeyor](https://www.appveyor.com/),
[Drone](https://cloud.drone.io/welcome), and [TravisCI](https://travis-ci.com/)
it is possible to build and upload installable packages to the
[conda-forge](https://anaconda.org/conda-forge) [anaconda.org](https://anaconda.org/)
channel for Linux, Windows and OSX respectively.

To manage the continuous integration and simplify feedstock maintenance
[conda-smithy](https://github.com/conda-forge/conda-smithy) has been developed.
Using the ``conda-forge.yml`` within this repository, it is possible to re-render all of
this feedstock's supporting files (e.g. the CI configuration files) with ``conda smithy rerender``.

For more information please check the [conda-forge documentation](https://conda-forge.org/docs/).

Terminology
===========

**feedstock** - the conda recipe (raw material), supporting scripts and CI configuration.

**conda-smithy** - the tool which helps orchestrate the feedstock.
                   Its primary use is in the construction of the CI ``.yml`` files
                   and simplify the management of *many* feedstocks.

**conda-forge** - the place where the feedstock and smithy live and work to
                  produce the finished article (built conda distributions)


Updating scipoptsuite-feedstock
===============================

If you would like to improve the scipoptsuite recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`conda-forge` channel, whereupon the built conda packages will be available for
everybody to install and use from the `conda-forge` channel.
Note that all branches in the conda-forge/scipoptsuite-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string)
   back to 0.

Feedstock Maintainers
=====================

* [@AntoinePrv](https://github.com/AntoinePrv/)
* [@fschloesser](https://github.com/fschloesser/)
* [@ju-manns](https://github.com/ju-manns/)
* [@pokutta](https://github.com/pokutta/)

