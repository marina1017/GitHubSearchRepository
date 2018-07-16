//
//  GitHubAPI.swift
//  GitHubSearchRepository
//
//  Created by 中川万莉奈 on 2018/06/02.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import Foundation

final class GitHubAPI {
    struct SearchRespositories: GitHubRequest {
        let keyword : String
        // GitHubRequestが要求する連想型
        typealias Response = SearchResponse<Repository>
        
        var method: HTTPMethod {
            return .get
        }
        
        var path: String {
            return "/search/repositories"
        }
        
        var parameters: Any? {
            return ["q": keyword]
        }
    }
    
    struct SearchUsers :GitHubRequest {
        let keyword: String
        
        typealias Response =  SearchResponse<User>
        
        var method: HTTPMethod {
            return .get
        }
        
        var path: String {
            return "/serch/users"
        }
        
        var parameters: Any? {
            return ["q": keyword]
        }
    }
}
