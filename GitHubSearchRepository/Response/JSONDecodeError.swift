//
//  JSONDecodeError.swift
//  GitHubSearchRepository
//
//  Created by 中川万莉奈 on 2018/06/02.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import Foundation

enum JSONDecodeError : Error {
    case invalidFormat(json: Any)
    case missingValue(key: String, actualValue: Any?)
}
