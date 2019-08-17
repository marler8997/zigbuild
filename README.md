# zig-update

A convenient tool to quickly download the latest zig compiler.  Currently written in python3.  Run `./zig-update` on linux and `python3 zig-update` on windows.

This tool installs zig into a versioned sub-directory in your `PATH` and adds a script/symlink file directly in the `PATH` directory so that `zig` can be executed from anywhere.  The `zig-update` script will find this directory from previous installations or will prompt to select one if not found.  On linux, installing zig to `~/bin` would result in these files:

Linux:
```
# the extracted zig tarball
~/bin/zig-linux-x86_64-0.4.0+9daf0140/

# a symlink to be able to invoke zig from anywhere
~/bin/zig -> zig-linux-x86_64-0.4.0+9daf0140/zig
```

And on windows if installed to `C:\`, then it would install these files:

Windows:
```
# the extracted zig zip archive
C:\zig-windows-x86_64-0.4.0+9daf0140

# a batch file that forwards calls to zig-windows-x86_64-0.4.0+9daf0140 to be able to invoke zig from anywhere
C:\zig.bat
```

The script downloads a json file from https://ziglang.org/download/index.json to find the latest version.  The script will perform this fetch every time it is executed, but will only download/extract the latest version if it has not already done so.

Currently the script leaves the previous version of zig around.  A future addition may be for the script to remove that when it installs a newer version.

# Windows

### Prepare a new build

```
cd <zig_repo>
mkdir <build_dir>
```

### Generate a build
```
cd <build_dir>
<this_repo>\cmake <llvm-dir>
```

### Run the build
```
msbuild -p:Configuration=Release -m:<cpu_count> INSTALL.vcxproj
```

### Run the tests
```
bin\zig build --build-file ..\build.zig test
```

# Using Nix

* Zig stays pretty up-to-date with llvm, so you may need to add the nix unstable channel

NixOS:
```
# check if nixos-unstable is added:
sudo nix-channel --list

# if not added run
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
sudo nix-channel --update
```

```
# NixOS
nix-shell --pure --argstr channel nixos-unstable
```


NixPkgs (using nix as package manager only):
```
# check if nixpkgs-unstable is added:
nix-channel --list

# if not added run
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs-unstable
nix-channel --update
```

* Setup an isolated environment
```

```

* Install llvm_8 and clang_8

```
# NixOS
sudo nix-env -iA nixos-unstable.llvm_8 nixos-unstable.clang_8

# NixPkgs
nix-env -iA nixpkgs-unstable.llvm_8 nixpkgs-unstable.clang_8
```

* Now build
```
cd <zig_repo>
mkdir <build_dir>
cd <build_dir>
cmake ..
```