# vlib

[[License](./doc/LICENSE.md)]


A repository of *C++11* solutions, assembled as micro-components.

---

## Table of contents

1.  [ Overview ](#overview)
2.  [ Dependencies ](#dependencies)
3.  [ Installation ](#installation)
4.  [ Usage ](#usage)
5.  [ Tests ](#tests)
6.  [ Release History ](#release)
7.  [ Contributing ](#contributing)
8.  [ Support ](#support)
9.  [ License ](#license)
10. [ FAQ ](#faq)

---

<a name="overview"></a>
## 1. Overview

Each component provides a solution, or helps in solving a problem. Components combine a common approach to use, connect to QMake and CMake projects. All the code is delivered as is, no source codes need to be collected, but you need to connect the necessary components directly to the build system of the QMake / CMake project.

There are many subtleties and questions, this is a "seed" description that should be developed as far as possible, questions and comments are very welcome.

---

- [gtests](./src/gtests/README)
- [vbyte_buffer]()
- [vcan_socket](./src/vcan_socket/README)
- [vcat](./src/vcat/README)
- [vchrono]()
- [vcompiler_traits](./src/vcompiler_traits/README)
- [vgit](./src/vgit/README)
- [vlog](./src/vlog/README)
- [vnetwork]()
- [vposix](./src/vposix/README)
- [vprofile]()
- [vserial_port]()
- [vsettings](./src/vsettings/README)
- [vsignal]()
- [vtimer]()

---

<a name="dependencies"></a>
## 2. Dependencies

Basic:<br>

- [build-essential](https://packages.debian.org/ru/sid/build-essential)
- [C++11 (GCC-5, G++-5)](https://en.cppreference.com/w/cpp/11)
- [CMake (> 3.10)](https://cmake.org)
- [Make (> 4.2)](https://en.wikipedia.org/wiki/Make_(software))
- [LCov (> 1.14)](http://ltp.sourceforge.net/coverage/lcov.php)
- [GCov (>9.3)](https://linux.die.net/man/1/gcov)
- [CLang-Tidy (> 10.0)](https://clang.llvm.org/extra/clang-tidy/)
- [Ninja (> 1.10)](https://ninja-build.org)

Third-party (for visualization):<br>

- [Doxygen (> 1.8)](https://www.doxygen.nl/index.html)
- [Graphviz](https://graphviz.org)
- [Latex](https://www.latex-project.org/get/)
- [Tree](https://pingvinus.ru/note/tree)

---

<a name="installation"></a>
## 3. [Installation](./doc/INSTALL.md)

The installation procedures in Linux Ubuntu 16.04/14.04 32-bit LTS or Linux Mint 19.* /20. * 64-bit are shown [here](./doc/INSTALL.md) as examples.

---

<a name="usage"></a>
## 4. Usage

The *qmake* & *cmake* folders are added to add **.pri & *.cmake* files there (with symlinks). In the same place, simple connections of some keys are created (for example, ```cmake/c++11.cmake``` ```qmake/pthread.pri``` ).

To connect the **<vcomponent>** you need: <br>
1. Download the repository.<br>
2. Register the lines in the project file:<br>

For cmake:
```
	set( VLIBS_DIR "path_to/vlibs" )
	include( "${VLIBS_DIR}/cmake/vcomponent.cmake" )
```

For qmake:
```
	VLIBS_DIR = $$PWD/path_to/vlibs
	include( $$VLIBS_DIR/qmake/vcomponent.pri )
```

3. Enjoy:
```
	#include "vcomponent.h"
	VComponent c;
	c.use();
```

You can find more scripts in [scripts/](./scripts).

---

<a name="tests"></a>
## 5. [Tests](./tests/README.md)

---

<a name="release"></a>
## 6. [Release History](./doc/HISTORY.md)

---

<a name="contributing"></a>
## 7. Contributing

1. Fork it (<http://bb.niias/projects/TOOL/repos/vlib/browse>).
2. Read [Readme](./README.md), [License](./doc/LICENSE.md), [Code of Conduct](./doc/CODE_OF_CONDUCT.md) and [Condributing Guidelines][contributing].
3. Create your fix or feature branch (`git checkout -b feature/name`).
4. Make changes according to [Condributing Guidelines][contributing].
5. Make unit tests.
6. Build repo and tests.
7. Correct Readmes for whole directories.
8. Ensure that it is likely to be merged.
9. Commit your changes (```git add . & git commit -m "Feature. Add wrapper class WrapperClass."```).
10. Push to the branch (```git push origin feature/new-wrapper-class```)
11. Create a new Pull Request to `develop`

---

<a name="support"></a>
## 8. Support

Reach out of us at one of the following places!

Alexander Gromtsev:<br>
- Email at - elapidae.grom@gmail.com

Dmitrii Leliuhin:<br>
- Email at - dleliuhin@gmail.com

---

<a name="license"></a>
## 9. [License](./doc/LICENSE.md)

---

<a name="faq"></a>
## 10. [FAQ](doc/FAQ.md)

---

[contributing]: http://confluence.niias/pages/viewpage.action?pageId=7340222

---

**JSC NIIAS**