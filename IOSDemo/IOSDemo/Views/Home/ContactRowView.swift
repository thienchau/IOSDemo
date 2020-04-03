//
//  SwiftUIView.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 4/2/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import SwiftUI
import URLImage

struct ContactRowView: View {
    
    @State var contactRowViewModel: ContactRowViewModel
    
    var body: some View {
        
        HStack {
            
            URLImage(self.contactRowViewModel.imageURL, content: {
                $0.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
            })
            
            VStack(alignment: .leading) {
                Text(self.contactRowViewModel.name).fontWeight(.semibold).foregroundColor(.titleText)
                Text(self.contactRowViewModel.subContent).fontWeight(.light)
            }
            
        }.frame(height: 65)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContactRowView(contactRowViewModel: ContactRowViewModel(Contact.default))
    }
}
