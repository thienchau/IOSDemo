//
//  LoginView.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 3/30/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import SwiftUI

struct LoginView<Model>: View where Model: LoginViewModelProtocol {
    
    @State private var user = ""
    @State private var pass = ""
    @State private var showErrorAlert = false;
    
    @ObservedObject var viewModel: Model
    
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color.mainBg.edgesIgnoringSafeArea(.all)
            VStack {
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 110)
                
                Text("signin")
                    .font(.custom("Monofur", size: 50)).padding([.top, .bottom], 20)
                
                VStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text("Email").font(.headline).fontWeight(.light).foregroundColor(Color.titleText)
                        HStack {
                            TextField("emailInput", text: $user)
                            
                            if validEmail()  {
                                Image("checked").resizable().colorInvert().colorMultiply(.checkColor)
                                    .frame(width: 25, height: 25)
                            }
                        }.frame(height: 35)
                        Divider()
                    }
                    VStack(alignment: .leading) {
                        Text("password").font(.headline).fontWeight(.light).foregroundColor(Color.titleText)
                        HStack {
                            SecureField("passInput", text: $pass)
                            
                            if validPassword() {
                                Image("checked").resizable().colorInvert().colorMultiply(.checkColor)
                                    .frame(width: 25, height: 25)
                            }
                        }.frame(height: 35)
                        Divider()
                    }
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Text("forgot").foregroundColor(Color.gray.opacity(0.75))
                        }
                    }
                    
                    VStack {
                        Button(action: {
                            if self.validEmail() && self.validPassword() {
                                self.viewModel.saveLogin()
                                NotificationCenter.default.post(.init(name: .didLogin))
                            } else {
                                self.showErrorAlert = true
                            }
                        }) {
                            Text("signin").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 150).padding()
                        }
                        .background(Color.mainBtnColor)
                        .cornerRadius(40)
                        .alert(isPresented: self.$showErrorAlert) {
                            return Alert(title: Text("signinError"), dismissButton: .default(Text("OK"), action: {
                                self.showErrorAlert = false
                            }))
                        }
                    }.padding([.top], 50)
                    
                }.padding(.horizontal, 20)
                
                
                
            }
        }
    }
    
    func validEmail() -> Bool {
        return user != "" && user.validateEmail()
    }
    
    func validPassword() -> Bool {
        return pass != "" && pass.count >= 6
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
                
        LoginView(viewModel: LoginViewModel())
        
    }
}
