//
//  UserML.swift
//  Floward
//
//  Created by Shumakov Dmytro on 09.11.2022.
//

import Foundation

struct UserML: Codable {
    
    var url: String?
    var name: String?
    var userId: Int?
    var albumId: Int?
    var thumbnailUrl: String?
    
    var posts: [PostML]?
    
    enum CodingKeys: String, CodingKey {
        case url, name, userId, albumId, thumbnailUrl, posts
    }
}
