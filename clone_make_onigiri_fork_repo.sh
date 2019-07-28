# get fork repo lists by github api. and clone or pull and make

curl https://api.github.com/repos/OneNightROBOCON/onigiri_war/forks | jq -r .[].owner.login |xargs -I @ bash makews_clone_make_onigir.sh @
