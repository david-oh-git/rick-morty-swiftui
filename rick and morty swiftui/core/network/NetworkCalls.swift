//
//  NetworkCalls.swift
//  rick and morty swiftui
//
//  Created by david on 7/23/24.
//

import Foundation


/// Make easy for safe API calls with errors handled
/// - Parameters:
///   - urlString: String url to call
///   - type: Network response type must extend Codable type
/// - Returns: Tuple in format (optional API response data, optional error)
func safeApiCall<T : Codable>(urlString: String, type: T.Type) async -> (data:T?,error:Error?) {
    do {
        let url = URL(string: urlString)!
        let (data,_) = try await URLSession.shared.data(from: url)
        return try (JSONDecoder().decode(type, from: data),nil)
    } catch {

        return (nil,error)
    }
}

/// Make safe API calls easily
/// - Parameters:
///   - urlString: The URL to call
///   - type: Network response type must extend Codable type
/// - Returns: Network Response 
func safeCall<T : Codable>(
    urlString: String,
    type: T.Type
) async -> NetworkResponse<T> {
    do {
        let url = URL(string: urlString)!
        let (data,_) = try await URLSession.shared.data(from: url)
        return try NetworkResponse(data: JSONDecoder().decode(type, from: data), error: nil)
    } catch {
        print("Error : \(error)")
        return NetworkResponse(data: nil , error: error)
    }
}

