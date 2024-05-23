figures = $(wildcard figures/*)
sources = $(wildcard *.typ)

main_source = slides.typ
output = slides.pdf

all: compile

compile: $(sources) $(figures) target
	typst compile $(main_source) target/$(output)

watch: $(sources) $(figures) target
	typst watch $(main_source) target/$(output)

target:
	mkdir -p target
clean:
	rm -rf target
