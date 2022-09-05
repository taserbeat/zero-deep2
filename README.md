# 0 から作る Deep Learning 2

書籍を勉強する際に書いたコードを保管する。

# 学習済みパラメータのファイルについて

サイズが大きい学習済みパラメータファイルは Git で追跡したくないので、ダウンロードして取得する。  
必要なファイルは以下のリリースでダウンロード可能である。

[releases/parameters](https://github.com/taserbeat/zero-deep2/releases/tag/parameters)

また、[download_param.sh](./download_param.sh)を実行することで適切なフォルダにダウンロードされるようになっている。

```bash
# すべての学習済みパラメータファイルをダウンロード
bash ./download_param.sh all

# 特定のパラメータファイルのみをダウンロード
bash bash ./download_param.sh ch06
```
