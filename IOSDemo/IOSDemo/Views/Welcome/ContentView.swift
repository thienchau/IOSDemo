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

struct ContentView: View {
    
    @State var viewType = WelcomeType.splash
    @State var showSplash = true

    
    var body: some View {
        
        ZStack {
            
            if self.viewType == .home {
                HomeView()
            } else if self.viewType == .login {
                LoginView()
            }
            
            WelcomeView()
                .opacity(self.viewType == .splash ? 1 : 0)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        withAnimation() {
                            if AppDefaults.shared.getLogin() {
                                self.viewType = .home
                            } else {
                                self.viewType = .login
                            }
                        }
                    }
            }
        }
        .onAppear() {
            NotificationCenter.default.addObserver(forName: .didLogin, object: nil, queue: nil, using: self.onDidLogin)
            NotificationCenter.default.addObserver(forName: .didLogout, object: nil, queue: nil, using: self.onDidLogout)
        }
        .onDisappear() {
            NotificationCenter.default.removeObserver(self)
        }
    }
    
    func onDidLogin(_ notification:Notification) {
        self.viewType = .home
    }
    
    func onDidLogout(_ notification:Notification) {
        self.viewType = .login
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
