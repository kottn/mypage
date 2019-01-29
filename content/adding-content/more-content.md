---
title: "はじめての conda"
date: 2019-01-25T14:16:42+09:00
draft: false
menu:
  main:
    parent: "Adding content"
    Identifier: "Begin conda"
    weight: 201
---

## conda と Anaconda/Miniconda
conda は、主に Python 用に作られたパッケージ管理システムと環境マネジメントシステム。単体ではリリースされておらず、Anaconda や Anacondaサーバー、Miniconda に内包されている。機械学習ライブラリのパッケージ等を簡単にインストールでき、また環境の再現性も高いので、機械学習研究者界隈では Python 環境構築時のデファクト・スタンダードである。Anaconda/Miniconda は Python 本体と科学技術計算の基本ライブラリがセットになった「ディストリビューション」で、conda は Anaconda や Miniconda などに内包される「パッケージ管理＆環境マネジメントシステム」である。

もう少し詳しく知りたい人は[ここ](http://corochann.com/setup-python-environment-1395.html)をよむ。

[公式サイト](https://conda.io/docs/index.html)

## conda のインストール

[Anaconda 公式スクリプト](https://www.anaconda.com/download/#linux) で入れたいところですが、不穏な記事を見つけました。

> However, if you only install anaconda, it also installs curl, sqlite, openssl and override additional commands, which might cause conflict with existing environment. **Recommended way is to install anaconda on top of pyenv.**</br>
> *http://corochann.com/setup-python-environment-1395.html*

検証したところ、たしかに乗っ取られました。おすすめ通り、**pyenv 経由で Anaconda を導入**することにします。

### (Step 1) pyenv の導入

```
$ git clone https://github.com/pyenv/pyenv.git ~/.pyenv
```

- `~/.bash_profile`（or `~/.profile`）に以下の5行を追加

```bash
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi
```

- 読み込む

```
$ source ~/.bash_profile
```

### (Step 2) Anaconda の導入

```
$ pyenv install -l | grep ana         # 最新版を確認（2系:anaconda2-*, 3系:anaconda3-*）
$ pyenv install anaconda3-5.1.0       # 特に理由がなければ、3系の一番新しいやつ
$ pyenv rehash
```

- Anaconda をメインの python に設定

```
$ pyenv global anaconda3-5.1.0
$ pyenv versions
   system
 * anaconda3-5.1.0 (set by /home/kotani/.pyenv/version)
```

- 戻す場合

```
$ pyenv global system
```

- pyenv と Anaconda の `activate` の競合を避ける（Anaconda の activate を使用するようになる）

```sh
$ echo 'export PATH="$PYENV_ROOT/versions/anaconda3-5.1.0/bin/:$PATH"' >> ~/.bash_profile
$ source ~/.bash_profile
```

- conda 自体のアップデート

```sh
$ conda update conda
```

- 全部アップデート

```sh
$ conda update --all
```

### (Step 3) Python の確認

```
$ python --version
$ pip --version
```

### (Step 0) やっぱり消す
*Anaconda のみ*
- `$ pyenv uninstall anaconda3-5.1.0`
- `~/.bash_profile` の `export PATH="$PYENV_ROOT/versions/anaconda3-5.1.0/bin/:$PATH"` を消す。
- `~/.pyenv/version` に Anaconda 時代の環境名が書かれていたら消す。

*pyenv ごと*
- `$ rm -rf ~/.pyenv`
- `~/.bash_profile` (or `~/.profile`) に追記した `$PYENV_ROOT` 周りの設定（5行）も消す

## conda の使い方
### (Tips 1) 環境を作る / 消す
- 作る

```
$ conda search python                       # 導入できる python のバージョン検索
$ conda create -n foo python=3.6 anaconda   # foo は任意の環境名
$ conda create -n py2 python=2.7 anaconda   # 2系を入れたいとき
```

- 作った環境を確認

```
$ conda env list	# ただし create してなければ root もしくは base という環境のみ
```

- 入る

```
$ source activate foo
```

- 出る

```
(foo)$ source deactivate
```

- 消す

```
$ conda remove -n foo --all
```

### (Tips 2) パッケージを入れる / 消す
- 入ってるやつ一覧

```sh
(foo)$ conda list              # foo のパッケージ一覧
$ conda list -n py2            # py2 のパッケージ一覧
```

- 探す

```
(foo)$ conda search matplotlib
```

- インストール

```
$ conda install matplotlib
$ conda install matplotlib=1.5.3  # バージョン指定
```

- アンインストール

```
$ conda uninstall matplotlib
```

- アップデート

```
$ conda update --all
$ conda update matplotlib
```

### (Tips 3) 環境の保存 / 読み込み
- エクスポート

```
$ conda env export > myenv.yaml     # myenv のとこはなんでもいい。
```

- インポート

```
$ conda env create --file myenv.yaml
```

### (Tips 4) 環境の名前を変える
- クローンを作って元を消す

```
$ conda create -n new_name --clone old_name
$ conda remove -n old_name --all
```

### (Tips 5) JupyterNotebook の設定
- Notebook上で作った環境を選べるようになる（はず）

```
$ conda install ipykernel
$ conda install nb_conda
$ python -m ipykernel install --user
```

### (Tips 6) Help を見る
- conda のヘルプ（コマンド一覧）

```
$ conda --help
```

- create コマンドのヘルプ

```
$ conda create --help
```

## pyenv と gitk の干渉
個人の環境に `gitk` と `pyenv` が入っている場合、`gitk` の文字が読めないほど汚くなる場合がある。原因は `gitk` で読んでいる `wish` がシステムのものではなく `pyenv` のものを呼んでしまうようになるからである（↓）

```
$ which wish
/home/username/.pyenv/shims/wish
```

なので `gitk` 起動時に `/usr/bin/wish` を明示的に呼ぶようにして解決する。

```
$ sudo vi /usr/bin/gitk
```

- 3行目を編集

```diff
-exec wish "$0" -- "$@"
+exec /usr/bin/wish8.6 "$0" -- "$@"
```

ちなみに `wish8.6` を呼んでいるのは無印よりもさらにフォントが奇麗だったから。


以上。


