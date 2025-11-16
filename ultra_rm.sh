#!/bin/bash

# 対象一覧を取得
items=(*)

# 要素がない場合
if [ ${#items[@]} -eq 0 ]; then
	echo "このディレクトリには何もないよ！"
	exit 0
fi

echo "=== 現在のファイル/ディレクトリ一覧 ==="
for i in "${!items[@]}"; do
	echo "[$i] ${items[$i]}"
done

echo ""
read -p "削除したい番号をスペース区切りで入力してください: " -a selection

echo ""
echo "選択されたもの:"
for idx in "${selection[@]}"; do
	echo " - ${items[$idx]}"
done

echo ""
read -p "本当に削除しますか？(y/N): " confirm

if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
	echo "キャンセルしたよ。"
	exit 0
fi

echo ""
echo "削除中…"

for idx in "${selection[@]}"; do
	target="${items[$idx]}"
	if [ -d "$target" ]; then
		rm -r "$target"
	else
		rm "$target"
	fi
	echo "削除済み: $target"
done

echo "完了！"
