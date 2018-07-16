//
//  GitHubClient.swift
//  GitHubSearchRepository
//
//  Created by 中川万莉奈 on 2018/06/02.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import Foundation

class GitHubClient {
    private let session: URLSession = {
        let configration = URLSessionConfiguration.default
        let session = URLSession(configuration: configration)
        return session
    }()
    
    func send<Request: GitHubRequest>(
        request: Request, completion: @escaping (Result<Request.Response, GitHubClientError>) -> Void) {
        //URLRequest型のインスタンスを生成
        let urlRequest = request.buildURLRequest()
        print("///////5/////////")
        //内部的に保持しているURLsessionクラスのインスタンスに渡す
        let task = session.dataTask(with: urlRequest) {
                data, response, error in
            print("data:",data)
            print("response:",response)
            print("error:",error)
            print("///////6/////////")
            switch (data,response,error) {
            case (_, _, let error?):
                //HTTPステータスコードが200番台
                completion(Result(error: .connectionError(error)))
            case (let data?, let response?, _):
                do {
                    let response = try request.response(from: data, urlResponse: response)
                    completion(Result(value: response))
                    
                    //200番台以外のエラー
                } catch let error as GitHubAPIError {
                    //エラーレスポンスを受け取った状況を示す
                    completion(Result(error: .apiError(error)))
                } catch {
                    //レスポンスが想定通りの構成をしていなかった時
                    completion(Result(error: .responseParseError(error)))
                }
            default:
                fatalError("invalid response combination \(data), \(response),\(error).")
            }
        }
        
        //HTTPリクエスト送信
        task.resume()
        print("task",task)
        
    }
}

enum Result<T, Error: Swift.Error> {
    case success(T)
    case failure(Error)
    
    init(value: T) {
        self = .success(value)
    }
    
    init(error:Error) {
        self = .failure(error)
    }

}
