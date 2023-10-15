.PHONY: build run test

build:
	stack build

build-quiet:
	stack build --verbosity 0

# Run the last thing worked on
run: build-quiet
	stack exec --verbosity 0 -- haskbook-exe latest

test:
	stack test
