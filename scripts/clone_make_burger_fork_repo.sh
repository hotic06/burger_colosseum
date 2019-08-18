# get fork repo lists by github api. and clone or pull and make

# original repo
bash makews_clone_make_burger.sh OneNightROBOCON

# forked repo
curl https://api.github.com/repos/OneNightROBOCON/burger_war/forks | jq -r .[].owner.login |xargs -I @ bash makews_clone_make_burger.sh @

