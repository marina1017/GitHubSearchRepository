//
//  GitHubVlientError.swift
//  GitHubSearchRepository
//
//  Created by 中川万莉奈 on 2018/06/02.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import Foundation

enum GitHubClientError :Error {
    //通信に失敗
    case connectionError(Error)
    
    //レスポンスの解釈に失敗
    case responseParseError(Error)
    
    //APIからエラーレスポンスを受け取った
    case apiError(GitHubAPIError)
}
