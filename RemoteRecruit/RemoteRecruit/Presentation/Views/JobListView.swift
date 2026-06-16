//
//  JobListView.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//

import SwiftUI

struct JobListView: View {
    
    @StateObject var viewModel:JobListViewModel
    @EnvironmentObject var coordinator:AppCoordinator
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .task {
                viewModel.fetchJobs()
            }
    }
}
//#Preview {
//    JobListView()
//}
