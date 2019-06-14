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