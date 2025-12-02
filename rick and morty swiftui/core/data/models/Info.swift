//
//  Info.swift
//  rick and morty swiftui
//
//  Created by shinji on 7/20/24.
//

import Foundation

struct Info: Codable {
    
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
    
    init(count: Int, pages: Int, next: String?, prev: String?) {
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }
}
