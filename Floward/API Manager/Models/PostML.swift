//
//  PostML.swift
//  Floward
//
//  Created by Shumakov Dmytro on 09.11.2022.
//

import Foundation

struct PostML: Codable {
    
    var id: Int?
    var userId: Int?
    var title: String?
    var body: String?
    
    enum CodingKeys: String, CodingKey {
        case id, userId, title, body
    }
}
