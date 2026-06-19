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

    @StateObject var viewModel: JobDetailViewModel

    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 20) {
                
                JobDetailHeaderView(job: viewModel.job)
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Label(
                        "Job Description",
                        systemImage: "doc.text.fill"
                    )
                    .font(.headline)
                    
                    Divider()
                    
                    HTMLTextView(
                        htmlString: viewModel.job.description
                    )
                }
                .padding()
                .background(Color(.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 22))
                .shadow(
                    color: .black.opacity(0.05),
                    radius: 8,
                    y: 3
                )
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Job Details")
        .navigationBarTitleDisplayMode(.inline)
    }

    
}

#Preview {
    JobDetailView(viewModel: JobDetailViewModel(job: Job(id: 1, title: "IOS", companyName: "Genesis Infoweb", category: "Software",description: "",location: "Remote",salary: "100$")))
}
