//
//  WelcomeScreen.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 3/30/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    
    @State var startAnim = false
    let timeLogoRun = 1.0
    let timeButtonRun = 0.2
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                Color.mainBg.edgesIgnoringSafeArea(.all)
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 150)
                    .opacity(self.startAnim ? 1 : 0)
                    .position(x: geometry.size.width / 2 ,
                              y: self.startAnim ? geometry.size.height / 2 : geometry.size.height / 2 - 30)
                    .animation(.easeInOut(duration: self.timeLogoRun))
                
                Button(action: {
                    
                }) {
                    Text("welcome")
                        .bold()
                        .foregroundColor(.mainBtnColor)
                        .opacity(self.startAnim ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(self.timeButtonRun + self.timeLogoRun))
                }
                .frame(width: self.startAnim ? 280 : 45, height: 45)
                .cornerRadius(40)
                .position(x: geometry.size.width / 2,
                          y: self.startAnim ? geometry.size.height - 20 : geometry.size.height + 60)
                    .animation(Animation.easeInOut(duration: self.timeButtonRun).delay(self.timeLogoRun))
            }
        }
        .onAppear() {
            self.startAnim.toggle()
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
