.PHONY: build

build: dist/build/content.js dist/build/background.js dist/icons dist/manifest.json

pack: build
	chromium --pack-extension=./dist

clean-unsafe:
	rm -rf dist dist.crx dist.pem

dist/build/content.js: src/content.ts
	npm run content

dist/build/background.js: src/background.ts
	npm run background

dist/icons:
	cp -r ./icons dist/icons

dist/manifest.json: ./manifest.json
	cp ./manifest.json dist/manifest.json
