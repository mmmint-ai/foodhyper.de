
current_dir=$(shell pwd)
JEKYLL_VERSION=4.0

new:
	docker run --rm --volume="$(current_dir):/srv/jekyll" -it jekyll/jekyll:$(JEKYLL_VERSION) jekyll new .

build:
	docker run --rm --volume="$(current_dir):/srv/jekyll" -it jekyll/jekyll:$(JEKYLL_VERSION) jekyll build

serve: 
	docker run --name pitchforgood --volume="$(current_dir):/srv/jekyll" -p 4000:4000 -it jekyll/jekyll:$(JEKYLL_VERSION) jekyll serve --watch

serve-drafts:
	docker run --name pitchforgood --volume="$(current_dir):/srv/jekyll" -p 4000:4000 -it jekyll/jekyll:$(JEKYLL_VERSION) jekyll serve --watch --drafts

exec:
	docker exec -ti pitchforgood /bin/sh

clean:
	docker rm -f pitchforgood
