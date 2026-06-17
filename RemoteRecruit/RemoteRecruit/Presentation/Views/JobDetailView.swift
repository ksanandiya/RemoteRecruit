//
//  JobDetailView.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//

/// Displays complete job information.
///
/// Includes:
/// - Title
/// - Company
/// - Category
/// - HTML Description
/// 
import SwiftUI

struct JobDetailView: View {
    
    @StateObject private var viewModel: JobDetailViewModel
    
    init(viewModel: JobDetailViewModel) {
        _viewModel = StateObject(
            wrappedValue: viewModel
        )
    }
    
    var body: some View {
        
        ScrollView {
            
            VStack(
                alignment: .leading,
                spacing: 20
            ) {
                
                Text(viewModel.job.title)
                    .font(.largeTitle.bold())
                
                Text(viewModel.job.companyName)
                    .font(.title)
                    .foregroundStyle(.primary)
                
                Text(viewModel.job.category)
                    .font(.title3)
                    .foregroundStyle(.secondary)
                HStack {
                    
                    Text(viewModel.job.location)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(viewModel.job.salary).font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .font(.subheadline)
                
                Divider()
                
                Text("Job Description")
                    .font(.headline)
                
                HTMLTextView(htmlString: viewModel.job.description)
            }
            .padding()
        }
        .navigationTitle("Job Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
//    JobDetailView(job: Job(id: 1, title: "IOS", companyName: "Genesis Infoweb", category: "Software",description: ""))
}
