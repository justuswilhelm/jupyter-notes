NOTEBOOKS := notebooks
OUT := out
NOTEBOOKS := $(wildcard $(NOTEBOOKS)/*.ipynb)
TARGET := $(patsubst $(NOTEBOOKS)/%.ipynb,$(OUT)/%.md,$(NOTEBOOKS))


all: $(TARGET)

$(OUT)/%.md: $(NOTEBOOKS)/%.ipynb
	jupyter-nbconvert --exec --to markdown --output-dir $(dir $@) $<
