//
//  NetworkResponse.swift
//  rick and morty swiftui
//
//  Created by shinji on 11/10/25.
//

import Foundation

struct NetworkResponse<T> {
    
    let data: T?
    let error: Error?
}
