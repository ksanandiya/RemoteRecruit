//
//  JobRow.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 17/06/26.
//

/// Reusable row component for job list.
///
/// Displays summary information
/// about a job.
/// 
import SwiftUI

struct JobRow: View {

    let job: Job

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 12
        ) {

            HStack {

                Image(systemName: "briefcase.fill")
                    .font(.title3)
                    .foregroundStyle(.blue)

                Spacer()

                Text(job.category)
                    .font(.caption)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(.blue.opacity(0.1))
                    .clipShape(Capsule())
            }

            Text(job.title)
                .font(.headline)

            Text(job.companyName)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            HStack {

                Text(job.location).font(.subheadline)
                Spacer()
                Text(job.salary).font(.subheadline)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.secondary)
            }
            .font(.caption)
        }
        .padding()
        .background(
            RoundedRectangle(
                cornerRadius: 16
            )
            .fill(Color(.systemBackground))
        )
        .overlay(
            RoundedRectangle(
                cornerRadius: 16
            )
            .stroke(
                Color.gray.opacity(0.15),
                lineWidth: 1
            )
        )
    }
}
