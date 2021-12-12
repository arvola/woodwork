.PHONY: build

build: 
	hugo -D --minify

deploy:
	ipfs-deploy -p pinata -d cloudflare -t arvola.blog public/

