.PHONY: build

build: 
	hugo -D --minify

deploy:
	ipfs-deploy -u filebase -d cloudflare -t arvola.blog public/

fix-images:
	find content -iname '*.jpg' -type f | xargs -I '{}' identify -format '%w %h %i\n' {} | awk '$$2>1080{print$$3}' | xargs mogrify -auto-orient -resize '1920x1080>'
	exiftool -overwrite_original -all= -r .
