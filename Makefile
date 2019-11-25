SVG = gnu-slash-linux.svg
PNG = $(SVG).png
JPEG = $(SVG).jpg
WEBP = $(SVG).webp

WIDTH = 400

all: $(PNG) $(JPEG) $(WEBP)

$(PNG): $(SVG)
	inkscape --export-png=$@ --export-width=$(WIDTH) $<

$(JPEG): $(PNG)
	gm convert $(PNG) $(JPEG)

$(WEBP): $(PNG)
	gm convert $< $@

upload: all
	rsync --progress -v -a --inplace $(PNG) $(SVG) *.jpg *.png *.webp $(__HOMEPAGE_REMOTE_PATH)/to-del--gnu-slash-linux--6y7uj3wr7--captioned-image/
