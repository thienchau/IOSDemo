//
//  NetworkService.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 6/10/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation
import Combine

final class NetworkService: NetworkServiceType {
    private let session: URLSession
    
    init(session: URLSession = URLSession(configuration: URLSessionConfiguration.ephemeral)) {
        self.session = session
    }
    
    @discardableResult
    func load<T>(_ resource: Resource<T>) -> AnyPublisher<Result<T, NetworkError>, Never> {
        guard let request = resource.request else {
            return .just(.failure(NetworkError.invalidRequest))
        }
        return URLSession.shared.dataTaskPublisher(for: request)
            .mapError { _ in NetworkError.invalidRequest }
            .print()
            .flatMap { data, response -> AnyPublisher<Data, Error> in
                guard let response = response as? HTTPURLResponse else {
                    return .fail(NetworkError.invalidResponse)
                }
                
                guard 200..<300 ~= response.statusCode else {
                    return .fail(NetworkError.dataLoadingError(statusCode: response.statusCode, data: data))
                }
                return .just(data)
        }
        .decode(type: T.self, decoder: JSONDecoder())
        .map { .success($0) }
        .catch ({ error -> AnyPublisher<Result<T, NetworkError>, Never> in
            return .just(.failure(NetworkError.jsonDecodingError(error: error)))
        })
            .eraseToAnyPublisher()
    }
    
}
