//
//  NetworkServiceProtocol.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 6/10/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation
import Combine

protocol NetworkServiceProtocol: AnyObject {

    @discardableResult
    func load<T: Decodable>(_ resource: Resource<T>) -> AnyPublisher<Result<T, NetworkError>, Never>
}


enum NetworkError: Error {
    case invalidRequest
    case invalidResponse
    case dataLoadingError(statusCode: Int, data: Data)
    case jsonDecodingError(error: Error)
}
