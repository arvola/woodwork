.PHONY: build

build: 
	hugo -D --minify

deploy:
	ipfs-deploy -p pinata -d cloudflare -t arvola.blog public/

fix-images:
	exiftool -overwrite_original -all= -r .
	find . -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) -exec mogrify -resize '1920x1080>' {} \;
