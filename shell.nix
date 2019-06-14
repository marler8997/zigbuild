{ channel
}:

with import <nixos-unstable> {};

mkShell {
  buildInputs = [llvm_8 clang_8 gdb glibc binutils coreutils debianutils git gnumake];
}
