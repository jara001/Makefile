# Self-documenting Makefile

Idea comes from [Payton White](https://gist.github.com/prwhite/)'s gist [Makefile](https://gist.github.com/prwhite/8168133).

Enhanced by good comments from the community:
- [https://gist.github.com/prwhite/8168133#gistcomment-1716694](https://gist.github.com/prwhite/8168133#gistcomment-1716694)
- [https://gist.github.com/prwhite/8168133#gistcomment-1737630](https://gist.github.com/prwhite/8168133#gistcomment-1737630)


## Usage

1. Copy `help` target to your Makefile.
2. Mark each Makefile target with `##` comment:
```makefile
target: ## This is the help line
```
3. Group your targets using `##@` comments:
```makefile
another_target: ##@Grouped This will show up as 'Grouped targets'

other_target: ##@Grouped This will show right next to the 'another_target'
```
4. Use `make` to show help!
```
Usage: make [target] ...

Targets:
help      Show this help message.
target    This is the help line

Grouped targets:
another_target    This will show up as 'Grouped targets'
other_target      This will show right next to the 'another_target'
```
