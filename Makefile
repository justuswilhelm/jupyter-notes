.PHONY: all clean

NOTEBOOKS_PATH := notebooks
OUT := out
NOTEBOOKS := $(wildcard $(NOTEBOOKS_PATH)/*.ipynb)
TARGET := $(patsubst $(NOTEBOOKS_PATH)/%.ipynb,$(OUT)/%.md,$(NOTEBOOKS))


all: $(TARGET)

$(OUT)/%.md: $(NOTEBOOKS_PATH)/%.ipynb
	bin/markdown $< > $@

clean:
	rm $(OUT)/*.md

lint: $(TARGET)
	proselint out/*.md
