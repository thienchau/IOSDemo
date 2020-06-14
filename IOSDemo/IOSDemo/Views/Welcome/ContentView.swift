//
//  ContentView.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 3/28/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import SwiftUI

enum WelcomeType {
    case splash
    case login
    case home
}

struct ContentView<Model>: View where Model: ContentViewModelProtocol {
    
    @State var viewType = WelcomeType.splash
    @State var showSplash = true
    @State var loginNoti: NSObjectProtocol?
    @State var logoutNoti: NSObjectProtocol?
    
    @ObservedObject var viewModel: Model
    
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        ZStack {
            
            if self.viewType == .home {
                HomeView(viewModel: ContactListViewModel(userService: UserSerice(networkService: NetworkService())))
            } else if self.viewType == .login {
                LoginView(viewModel: LoginViewModel())
            }
            
            WelcomeView()
                .opacity(self.viewType == .splash ? 1 : 0)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        withAnimation() {
                            if self.viewModel.getLogin() {
                                self.viewType = .home
                            } else {
                                self.viewType = .login
                            }
                        }
                    }
            }
        }
        .onAppear() {
            self.loginNoti = NotificationCenter.default.addObserver(forName: .didLogin, object: nil, queue: nil) {_ in
                self.viewType = .home
            }
            self.logoutNoti = NotificationCenter.default.addObserver(forName: .didLogout, object: nil, queue: nil) {_ in
                self.viewType = .login
            }
        }
        .onDisappear() {
            NotificationCenter.default.removeObserver(self.loginNoti!)
            NotificationCenter.default.removeObserver(self.logoutNoti!)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}
