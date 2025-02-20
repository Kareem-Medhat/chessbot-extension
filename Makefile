.PHONY: build pack

build: dist/content.js dist/background.js dist/icons dist/manifest.json

pack: build
	chromium --pack-extension=./dist

clean-unsafe:
	rm -rf dist dist.crx dist.pem

dist/content.js: src/content.ts
	npm run content

dist/background.js: src/background.ts
	npm run background

dist/icons:
	cp -r ./icons dist/icons

dist/manifest.json: ./manifest.json
	cp ./manifest.json dist/manifest.json
