# downloadlatest

A tool to download the latest zig compiler.  Currently written in python3.

On windows this will install the latest zig compiler to a directory in your `PATH`.  Note that this does not install `zig.exe` directly into the directory so this alone does not allow you to run `zig` from the command line.  In order to do that, an additional `zig.bat` file is generated directly inside the `PATH` directory that forwards calls to the newly installed version of zig.  Using this method allows you to have multiple versions of zig installed and running `zig` will just use the latest version.

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