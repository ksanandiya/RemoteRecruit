//
//  JobDetailView.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//

import SwiftUI

struct JobDetailView: View {

    let job: Job

    var body: some View {

        ScrollView {

            VStack(
                alignment: .leading,
                spacing: 20
            ) {

                Text(job.title)
                    .font(.largeTitle.bold())

                Text(job.companyName)
                    .font(.title3)
                    .foregroundStyle(.secondary)

                HStack {

                    Label(
                        "Remote",
                        systemImage: "house.fill"
                    )

                    Spacer()

                    Text(job.category)
                }
                .font(.subheadline)

                Divider()

                Text("Job Description")
                    .font(.headline)

                Text(job.description.htmlToAttributedString)
            }
            .padding()
        }
        .navigationTitle("Job Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    JobDetailView(job: Job(id: 1, title: "IOS", companyName: "Genesis Infoweb", category: "Software",description: ""))
}
