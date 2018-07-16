//
//  main.swift
//  GitHubSearchRepository
//
//  Created by 中川万莉奈 on 2018/06/02.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import Foundation

print("Enter your query here>", terminator: "")

//入力された検索クエリの取得
guard let  keyword = readLine(strippingNewline: true) else {
    exit(1)
}
print("///////1/////////")
//APIクライアントの生成
let client = GitHubClient()
print("///////2/////////")
//リクエストの発行
let request = GitHubAPI.SearchRespositories(keyword: keyword)
print("///////3/////////")
//リクエストの送信
client.send(request: request, completion: { result in
    print("///////4/////////")
    switch result {
    case let .success(response):
        for item in response.items {
            //リポジトリの所有者と名前の出力
            print(item.owner.login + "/" + item.name)
        }
        exit(1)
    case let .failure(error):
        //エラー詳細を出力
        print(error)
        exit(1)
    }
})

//タイムアウト時間
let timeoutInterval: TimeInterval = 60

//タイムアウトまでメインスレッド停止
Thread.sleep(forTimeInterval: timeoutInterval)

//タイムアウト後の処理
print("Connection timeout")
exit(1)

