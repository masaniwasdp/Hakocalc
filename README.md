HakoniwaKilling
===

![HakoniwaKilling](https://github.com/masaniwasdp/Screenshots/blob/master/HakoniwaKilling.png)

「箱庭諸島」において怪獣を倒せる確率の計算ツールです。

## 概要
「箱庭諸島」において怪獣を倒すときに利用できる確率計算ツールです。
以下の計算機能があります。

+ 指定数のPPミサイルを撃ったときに怪獣を倒せる確率。
+ 指定の確率で怪獣を倒すのに十分なPPミサイルの数。
+ 指定数の範囲のPPミサイルを撃ったときの怪獣を倒せる確率の推移。

## ビルド

``` bash
$ cd ~
$ git clone https://github.com/masaniwasdp/HakoniwaKilling.git
$ cd HakoniwaKilling
$ stack build
```

## 実行

``` bash
$ cd ~/HakoniwaKilling
$ stack exec HakoniwaKilling-exe -- [Args]
```

+ `Args`: コマンドライン引数です。

### コマンドライン引数

+ `p [hp] [quantity]`: 指定数のPPミサイルを撃ったときに怪獣を倒せる確率を計算します。
+ `q [hp] [probability]`: 指定の確率で怪獣を倒すのに十分なPPミサイルの数を計算します。
+ `t [hp] [from] [to]`: 指定数の範囲のPPミサイルを撃ったときの怪獣を倒せる確率の推移を計算します。

#### 引数の説明

+ `hp`: 怪獣の体力。
+ `quantity`: PPミサイルの数。
+ `probability`: 怪獣を倒す確率。
+ `from`: 最小のPPミサイルの数。
+ `to`: 最大のPPミサイルの数。

## ライセンス
[MITライセンス](https://github.com/masaniwasdp/HakoniwaKilling/blob/master/LICENSE)が適用されます。

## 作者
+ masaniwa
