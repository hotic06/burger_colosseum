# burger_colosseum
burger war 予選会用の自動対戦スクリプト

## How TO USE
つかいかた。


### リポジトリのclone make
`clone_make_burger_fork_repo.sh` は実行すると https://github.com/OneNightROBOCON/burger_war をfork しているリポジトリをすべて
`~/wss/` clone し catkin_make する。
`~/wss/`ディレクトリがない場合は事前に作成してください。
```
bash clone_make_burger_fork_repo.sh
```



### 対戦リストの作成
match_list.csv にアカウント名をスペース区切りでならべる.
１行目から順にさいごの行まで試合を行う。

リスト手動でつくるのは大変なので、総当り用のリスト作成スクリプトなど作ったほうがいいかもしれません。


`match_list.csv` sample
```
ichiro jiro
foo bar
hoge hogehoge
```

### スクリプト実行
以上の準備ができたら下記を実行します。
```
python main.py
```


## その他
あまりテストできていないので、なにかぬけているかもしれません。
画面録画用のウインドウ位置の対応はまだできていません。。。

