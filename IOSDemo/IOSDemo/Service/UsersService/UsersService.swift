//
//  UsersService.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 6/10/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation
import Combine

protocol UserSeviceType {

    func getUsers() -> AnyPublisher<Result<[Contact], Error>, Never>
}

final class UserSerice: UserSeviceType {

    private let networkService: NetworkServiceType
    
    init(networkService: NetworkServiceType) {
        self.networkService = networkService
    }
    
    func getUsers() -> AnyPublisher<Result<[Contact], Error>, Never> {
        return networkService
            .load(Resource<GetUserResponse>.users())
        .map({ (result: Result<GetUserResponse, NetworkError>) -> Result<[Contact], Error> in
            switch result {
            case .success(let response): return .success(response.results)
            case .failure(let error): return .failure(error)
            }
        })
        .subscribe(on: Scheduler.backgroundWorkScheduler)
        .receive(on: Scheduler.mainScheduler)
        .eraseToAnyPublisher()
    }
}
