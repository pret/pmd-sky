This doc details the steps necessary to build a copy of _Pokémon Mystery Dungeon: Explorers of Sky_ from the sources contained in this repository.

## 0. Clone the repository

Using a terminal or Git client, clone this repository to your local device. All the steps that follow should be performed in the directory where you cloned this repository.

## 1. Installing MWCC compiler and Nitro SDK

To install the compiler and SDK needed for this project, run `make install_toolchain`. You will need `wget` and `p7zip` installed to run this command.

If you have issues with the `make` command above, you can also install the compiler and SDK manually.

### Manual installation
The build system requires the use of the Metrowerks C Compiler versions 2.0/sp2p2 to compile matching files. Download [mwccarm.zip](https://github.com/pret/pmd-sky/raw/workflows/assets/mwccarm.zip), and extract it to `tools/`. At the end of this operation, you should have the file `tools/mwccarm/2.0/sp2p2/mwccarm.exe`.

For Nitro SDK, download [NitroSDK-4_2-071210-jp.7z](https://github.com/pret/pmd-sky/raw/workflows/assets/NitroSDK-4_2-071210-jp.7z). Extract and copy the folder `tools/bin` from the Nitro SDK into the folder `tools` in your `pmd-sky` clone. At the end of this operation, you should have the file `tools/bin/makelcf.exe` inside your `pmd-sky` clone. Finally, copy `include/nitro/specfiles/ARM7-TS.lcf.template` into the subdirectory `sub`, and `include/nitro/specfiles/ARM9-TS.lcf.template` and `include/nitro/specfiles/mwldarm.response.template` into the project root.

## 2. Dependencies

### Linux

For Linux, if you have the [Nix](https://nixos.wiki/wiki/Nix_package_manager) package manager with [flake](https://nixos.wiki/wiki/Flakes) support enabled, you can install dependencies with it. Otherwise, you can install dependencies manually.

#### Nix flake
Use `nix develop` to start an environment with the tools present.

#### Manual installation
Building the ROM requires the following packages. If you cannot find one or more of these using your package distribution, it may be under a different name.

* make
* git
* build-essentials (build-essential on Ubuntu)
* binutils-arm-none-eabi
* wine (to run the mwcc executables)
* python3 (for asm preprocessor)
* libpng-devel (libpng-dev on Ubuntu)
* pkg-config
* pugixml (libpugixml-dev on Ubuntu)

NOTE: If you are using Arch/Manjaro or Void, you will only need base-devel instead of build-essentials or make or git. You will still need wine.

### Windows

Before following the respective guides, please install devkitARM and ensure the `DEVKITPRO` and `DEVKITARM` variables are added to `bashrc` such that:

Msys2:
```console
export DEVKITPRO=C:/devkitPro
export DEVKITARM=${DEVKITPRO}/devkitARM
```

Cygwin:
```console
export DEVKITPRO=/cygdrive/c/devkitPro
export DEVKITARM=${DEVKITPRO}/devkitARM
```

You will still require the following packages:

* make
* git
* build-essentials
* libpng-devel
* pugixml
* pkg-config

Install them using either the Cygwin package manager or using pacman on Msys2.

**NOTE FOR MSYS2:** You will need to compile and install [libpng](http://www.libpng.org/pub/png/libpng.html) from source.

### macOS

macOS 10.15 Catalina and later is supported on Intel and ARM64 hardware configurations. On ARM64, Rosetta 2 must be installed, as well as the following dependencies:

* GNU coreutils
* GNU make
* GNU sed
* LLVM clang compiler
* arm-gcc-bin
* git
* libpng
* pkg-config
* pugixml
* wine-crossover (includes wine32on64, required on Catalina and later to run 32-bit x86 EXEs)

They can be installed with the following commands:

```console
$ brew tap osx-cross/homebrew-arm
$ brew tap gcenx/wine
$ brew install coreutils make gnu-sed llvm arm-gcc-bin libpng git pkg-config
$ brew install wine-crossover
```

### Docker

This repository has a [devcontainer](https://containers.dev/) containing all the necessary dependencies, which can be used if you prefer not to install the dependencies manually.

## 3. Build ROM

Run `make` to build the ROM. This will build the North American ROM at `build/pmdsky.us/pmdsky.us.nds`. If you want the European or Japanese ROM, run `make eu` or `make jp` respectively.

There are targets for building and testing changes to individual components without repackaging the ROM. For the ARM9 modules, run `make main`. For the ARM7 module, run `make sub`. For the filesystem, run `make filesystem`.

At the end of building each of these, there is a checksum verification step. This makes sure that the final product is byte-for-byte equivalent to the retail ROM. To disable this, append `COMPARE=0` to your command.

### Windows

If you get an error in saving configuration settings when specifying the license file, you need to add a system environment variable called `LM_LICENSE_FILE` and point it to the `license.dat` file. Alternatively, run `mwccarm.exe` from an Administrator command prompt, PowerShell, or WSL session.

### After updating from upstream

This repository is still in a volatile state, and several files may be moved around or renamed. If you pull from upstream and experience errors rebuilding, try the following troubleshooting steps **one line at a time** until you get the message `build/pmdsky.us/pmdsky.us.nds: OK`:

```shell
make tidy && make compare
make clean && make compare
git clean -fdx && make compare
```

If, after the third step, you're still getting errors, please ask for help in the Discord.
