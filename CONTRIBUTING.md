## Submitting changes
To contribute to this repo, fork it to your account, make changes in your fork, then make a pull request back to the main repo. If you are unfamiliar with forks and pull requests, or if you need any other help using Git, join the [pret Discord] and ask in the #git channel.

Any changes to this repo must maintain a matching ROM, such that the ROM built with `make` is the same as the original _Explorers of Sky_ ROM. If the `make` build prints `build/pmdsky.us/pmdsky.us.nds: OK`, then the built ROM is matching. If `make` fails with an error like `shasum: WARNING: 1 computed checksum did NOT match` (or if it fails to compile), then the built ROM is not matching, and you will need to fix your changes before submitting them.

## What can I help out with?
The end goal of a decomp is to transform the ROM's assembly and binary data into more readable formats, which vastly simplifies hacking and research compared to reading/writing the binary data directly. There are several areas where you can help with this:
* Decompiling assembly to C.
* Labeling unknown symbols.
* Transforming binary data files into conventional data formats (e.g., JSON, PNG), and writing conversion scripts to transform these data formats back into the original binary data.

If you're unsure how to get started, here are some resources:
* [This repo's wiki](https://github.com/pret/pmd-sky/wiki) has some guides for decomp-specific processes, like decompiling functions.
* [Reverse Engineering a DS Game](https://www.starcubelabs.com/reverse-engineering-ds): A primer on how to reverse engineer a game, including common RE tools, an intro to ARM assembly, and strategies for finding information about a game through reverse engineering.
* [Whirlwind Tour of ARM Assembly](https://www.coranac.com/tonc/text/asm.htm#sec-arm): A thorough breakdown on ARM assembly.
* [pmdsky-debug](https://github.com/UsernameFodder/pmdsky-debug): A repository with debug information (e.g., labeled symbols, C headers, function documentation) about the _Explorers of Sky_ codebase. The EoS decomp is synced with `pmdsky-debug`'s symbol names, and many symbols in the decomp originally came from there. If the decomp is too advanced for your skill level, you can still indirectly contribute by submitting research to `pmdsky-debug`, which will be synced into the decomp afterwards.
* The [pret Discord]'s #pmd-sky channel is the go-to place if you have questions about this project.

[pret Discord]: https://discord.gg/d5dubZ3
