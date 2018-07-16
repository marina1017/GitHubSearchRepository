//
//  HTTPMethod.swift
//  GitHubSearchRepository
//
//  Created by 中川万莉奈 on 2018/06/02.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import Foundation

enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case head = "HEAD"
    case delete = "DELETE"
    case patch = "PATCH"
    case trace = "TRACE"
    case options = "OPTIONS"
    case connect = "CONNECT"
}
