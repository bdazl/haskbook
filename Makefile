.PHONY: build run test

build:
	stack build

# Run the last thing worked on
run:
	stack exec -- haskbook-exe latest

test:
	stack test
