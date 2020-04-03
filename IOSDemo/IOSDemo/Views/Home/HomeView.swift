//
//  HomeView.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 3/30/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showLogoutAlert = false
    
    @ObservedObject var contactListViewModel: ContactListViewModel = ContactListViewModel()
    
    var logoutButton: some View {
        Button(action: {
            self.showLogoutAlert.toggle()
        }) {
            Image(systemName: "arrow.uturn.left")
                .imageScale(.large)
                .padding()
        }
        .alert(isPresented: self.$showLogoutAlert) {
            Alert(title: Text("logout"), primaryButton: Alert.Button.default(Text("OK"), action: {
                AppDefaults.shared.saveLogin(false)
                CoreDataManager.shared.deleteAll()
                NotificationCenter.default.post(name: .didLogout, object: nil)
            }), secondaryButton: .cancel(Text("cancel")))
        }
    }
    
    var refreshButton: some View {
        Button(action: {
            self.contactListViewModel.refreshData()
        }) {
            Image(systemName: "arrow.clockwise")
                .imageScale(.large)
                .padding()
        }
    }
    
    init() {
        UITableView.appearance().backgroundColor = .mainBg
        UITableViewCell.appearance().backgroundColor = .mainBg
    }
    
    var body: some View {
        LoadingView(isShowing: self.$contactListViewModel.loading) {
            NavigationView {
                List {
                    ForEach(self.contactListViewModel.contactRowViewModels) { contactRowViewModel in
                        NavigationLink(destination: ContactDetailView(contactDetailVM: ContactDetailViewModel(contactRowViewModel.contact))) {
                            ContactRowView(contactRowViewModel: contactRowViewModel)
                        }
                    }
                }
                .navigationBarTitle(Text("The Contacts"))
                .navigationBarItems(leading: self.logoutButton, trailing: self.refreshButton)
            }
            .onAppear() {
                self.contactListViewModel.loadData()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
