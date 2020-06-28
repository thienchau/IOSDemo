//
//  HomeView.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 3/30/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import SwiftUI

struct HomeView<Model>: View where Model: ContactListViewModelProtocol {
    
    @State private var showLogoutAlert = false
    
    @ObservedObject var viewModel: Model
    
    init(viewModel: Model) {
        self.viewModel = viewModel
        setupTable()
    }
    
    func setupTable() {
        UITableView.appearance().backgroundColor = .mainBg
        UITableViewCell.appearance().backgroundColor = .mainBg
    }
    
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
                self.viewModel.logout()
                NotificationCenter.default.post(name: .didLogout, object: nil)
            }), secondaryButton: .cancel(Text("cancel")))
        }
    }
    
    var refreshButton: some View {
        Button(action: {
            self.viewModel.refreshData()
        }) {
            Image(systemName: "arrow.clockwise")
                .imageScale(.large)
                .padding()
        }
    }
    
    var body: some View {
        LoadingView(isShowing: self.viewModel.loading) {
            NavigationView {
                List {
                    ForEach(self.viewModel.contactRowViewModels) { contactRowViewModel in
                        NavigationLink(destination: ContactDetailView(viewModel: ContactDetailViewModel(contactRowViewModel.contact))) {
                            ContactRowView(viewModel: contactRowViewModel)
                        }
                    }
                }
                .navigationBarTitle(Text("The Contacts"))
                .navigationBarItems(leading: self.logoutButton, trailing: self.refreshButton)
            }
            .onAppear() {
                self.viewModel.loadData()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: ContactListViewModel(userService: UserSerice(networkService: NetworkService())))
    }
}
