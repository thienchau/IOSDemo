//
//  ContactDetailView.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 3/30/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import SwiftUI
import URLImage

struct ContactDetailView<Model>: View where Model: ContactDetailViewModelProtocol {
    
    var viewModel : Model
    
    var body: some View {
        
        ZStack {
            Color.mainBg.edgesIgnoringSafeArea(.all)
            
            VStack {
                MapView(coordinate: viewModel.coordinate)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 200)
                
                if viewModel.imageURL != nil {
                    URLImage(viewModel.imageURL!, content: {
                        $0.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                            .offset(y: -100)
                            .padding(.bottom, -100)
                    })
                }
                
                VStack(alignment: .center) {
                    Text(viewModel.name)
                        .font(.title)
                    Text(viewModel.email)
                        .font(.subheadline)
                    Text(viewModel.phone)
                        .font(.subheadline)
                    Spacer()
                }
                .padding(.top, 20)
                
                Spacer()
            }
        }
        
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(viewModel: ContactDetailViewModel(Contact.default))
    }
}
