//
//  NetworkManager.swift
//  nyc-high-school-details
//
//  Created by Nikhil Lalam on 11/4/23.
//

import Foundation

class NetworkManager {
    
    enum NetworkManagerError: Error{
        case invalidURL
        case urlSession(error: Error)
        case invalidStatusCode(status: Int)
        case failedToDecode
    }
     func fetchData(url: String) async throws -> Data {
         guard let url = URL(string: url) else { throw NetworkManagerError.invalidURL }
         
         let response: (Data, URLResponse)
         do{
             response = try await URLSession.shared.data(from: url)
         }catch {
             throw NetworkManagerError.urlSession(error: error)
     }
         if let statusCode = (response.1 as? HTTPURLResponse)?.statusCode, statusCode != 200 {
                 throw NetworkManagerError.invalidStatusCode(status: statusCode)
             }
     return response.0
     }
    
}









 
