//
//  JSONDecodable.swift
//  GitHubSearchRepository
//
//  Created by 中川万莉奈 on 2018/06/02.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import Foundation

protocol JSONDecodable {
    init(json: Any) throws
}
