#!/bin/bash

<<COMMENTOUT
Download heavy size parameter files.
COMMENTOUT

# -------------------------------------------------------------------------------------------

readonly SCRIPT_EXECUTED_DIR=$(pwd)
readonly SCRIPT_DIR=$(
  cd $(dirname $0)
  pwd
)

readonly TARGETS=("all" "ch06")

# -------------------------------------------------------------------------------------------

function download_ch06() {
  cd "${SCRIPT_DIR}/ch06"

  if [ -e "BetterRnnlm.pkl" ]; then
    rm "BetterRnnlm.pkl"
  fi

  # 参考1: https://qiita.com/takayukioda/items/edf371b3566bea64d046
  # 参考2: https://qiita.com/minamijoyo/items/0affb46414cb746438bc
  # -Lはリダイレクトがあった際も追従してダウンロードするためのオプション
  # -Lオプションがない場合はダウンロードファイルが0バイトとなって失敗するので、
  # GitHubのreleasesはリダイレクトが発生するのだと思われる (参考2.)
  curl -o ./BetterRnnlm.pkl -L https://github.com/taserbeat/zero-deep2/releases/download/parameters/BetterRnnlm.pkl

  cd "${SCRIPT_DIR}"
}

function download_all() {
  download_ch06
}

# -------------------------------------------------------------------------------------------

target=${TARGETS[0]}

# コマンドライン引数の解析
if [ $# -gt 1 ]; then
  echo "[Error] number of args is less than 1."
  exit 1
elif [ $# -eq 1 ]; then
  if $(echo ${TARGETS[@]} | grep -q $1); then
    target=$1
  else
    echo "[Error] '$1' is not supported as arg"
    exit 1
  fi
fi

# アクションの実行
if [ ${target} == "all" ]; then
  echo "download target: '${target}'"
  download_all
elif [ ${target} == "ch06" ]; then
  echo "download target: '${target}'"
  download_ch06
else

  echo "ターゲット: '${target}' は存在しません"
  echo "target: '${target}' is not supported."
  cd ${SCRIPT_EXECUTED_DIR}
  exit 1
fi

cd ${SCRIPT_EXECUTED_DIR}
