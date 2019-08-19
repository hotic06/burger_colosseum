# get repo lists by text. and clone or pull and make

# original repo
bash makews_clone_make_burger.sh OneNightROBOCON

#  repo
#cat ../etc/repo_list.txt | jq -r .[].owner.login |xargs -I @ bash makews_clone_make_burger.sh @
cut -d' ' -f1  ../etc/repo_list.txt | xargs -I @ bash makews_clone_make_burger.sh @

