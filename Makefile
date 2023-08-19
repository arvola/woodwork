.PHONY: build

build: 
	hugo -D --minify

deploy:
	ipfs-deploy -p pinata -d cloudflare -t arvola.blog public/

fix-images:
	find . -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) -exec mogrify -auto-orient -resize '1920x1080>' {} \;
	exiftool -overwrite_original -all= -r .
