//
//  SwiftUIView.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 4/2/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import SwiftUI
import URLImage

struct ContactRowView<Model>: View where Model: ContactRowViewModelProtocol {

    var viewModel: Model
    
    var body: some View {
        
        HStack {
            
            URLImage(self.viewModel.imageURL, content: {
                $0.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
            })
            
            VStack(alignment: .leading) {
                Text(self.viewModel.name).fontWeight(.semibold).foregroundColor(.titleText)
                Text(self.viewModel.subContent).fontWeight(.light)
            }
            
        }.frame(height: 65)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContactRowView(viewModel: ContactRowViewModel(Contact.default))
    }
}
