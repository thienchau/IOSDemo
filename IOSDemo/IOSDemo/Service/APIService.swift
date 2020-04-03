//
//  APIService.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 3/30/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation



final class APIService {
    
    static let shared = APIService(URL(string: "https://randomuser.me/api/")!)
    
    private let baseURL: URL
    
    private init(_ baseURL: URL) {
        self.baseURL = baseURL
    }
    
    func response<Request>(from requestType: Request, response: @escaping (Decodable?, APIServiceError?)->()) where Request : APIRequestType {
        
        let pathURL = URL(string: requestType.path, relativeTo: self.baseURL)!
        var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = requestType.queryItems
        var request = URLRequest(url: urlComponents.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, resonse, error in
            
            guard let data = data else {
                DispatchQueue.main.async {
                    response(nil, APIServiceError.responseError)
                }
                return
            }
            
            guard let decodedResponse = try? JSONDecoder().decode(Request.Response.self, from: data) else {
                DispatchQueue.main.async {
                    response(nil, APIServiceError.parseError)
                }
                return
            }
            
            DispatchQueue.main.async {
                response(decodedResponse, nil)
            }
            
        }.resume()
    }
}
