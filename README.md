# burger_colosseum
burger war 予選会用の自動対戦スクリプト

# 2020年3月大会予選

## 前提
今回は、すべてAWSのec2のGPUインスタンス上で実行することとした。

インスタンスは、各チームごとに用意した。

予選大会は各チーム３回試合を実施する。

クリーンな状態で試合ができるように、
試合毎にインスタンスを再起動する。

そのために、Ubuntuの起動時に、スクリプトが自動起動されるようにした。


## 使うスクリプト
- scripts/autostartup_exec.sh - このスクリプトをUbuntu起動時に自動実行するように設定しておく。gnome-terminalをひとつだけ開いて、autostartup.shを実行する。
- scripts/autostartup.sh - auto_startディレクトリにあるスクリプトのうち最も若い数字のスクリプトを一つだけ実行する。実行後、実行されたスクリプトの拡張子が「*.sh~」に変更され、インスタンスが細動する。こうすることで、スクリプト実行→再起動→スクリプト実行→再起動・・・が自動的に実行される。
- auto_start/*.sh - 自動実行されるスクリプトはここにいれる。最も若い数字のスクリプトが実行される
- scripts/autostartup_enabling.sh - auto_startディレクトリにあるスクリプトの拡張子を「*.sh~」→「*.sh」に変更する
- scripts/autostartup_remap.sh - auto_startupディレクトリにあるスクリプト内のユーザー名を指定のものに変更する。使い方： `./autostartup_remap.sh user_name`
- kill-burger.sh - 使用した全てのプロセスをkillする
- match_202003_yosen.sh - 今回予選用のスクリプト。使い方：`./match_202003_yosen.sh user_name enemy`
- movie_add_capture.sh - 動画ファイルの上部にスクリプトを追加する。使い方：`./movie_add_capture.sh caption input.mp4 output.mp4`
- movie_generate.sh - HOMEディレクトリにある３試合の動画にキャプションを追加して、結合するスクリプト
- set_window_pos.sh - Gazeboの配置と視点を修正するスクリプト
- set_window_pos_2.sh - RVIZの配置と視点を修正して、Gazeboとjudgeウインドウを全面にだすスクリプト
- wait_end_game.py - 試合が終わるまで待つスクリプト
- wait_ffmpeg.sh - 動画のキャプチャ・変換が終わるまで待つスクリプト

## 使い方

# 以下、２０１９年8月大会のREADME
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


## 注意事項
burger_colosseumの置き場所はHOMEディレクトリ直下

.bashrcのROS関係の各種設定は消しておく。

