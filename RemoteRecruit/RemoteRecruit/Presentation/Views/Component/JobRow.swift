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

        VStack(alignment: .leading, spacing: 16) {

            // MARK: Header

            HStack(alignment: .top, spacing: 14) {

                ZStack {
                    Circle()
                        .fill(Color.blue.opacity(0.15))
                        .frame(width: 56, height: 56)

                    Image(systemName: "building.2.fill")
                        .font(.title2)
                        .foregroundStyle(.blue)
                }

                VStack(alignment: .leading, spacing: 8) {

                    Text(job.companyName)
                        .font(.headline)
                        .lineLimit(1)

                    Text(job.title)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)

                    Text(job.category)
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.blue)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.blue.opacity(0.12))
                        .clipShape(Capsule())
                }

                Spacer()
            }

            Divider()

            // MARK: Footer

            HStack {

                Label {
                    Text(job.location)
                        .lineLimit(2)
                } icon: {
                    Image(systemName: "mappin.and.ellipse")
                }
                .font(.footnote)
                .foregroundStyle(.secondary)

                Spacer()

                if !job.salary.isEmpty {
                    Text(job.salary)
                        .lineLimit(1)
                    .font(.footnote)
                    .foregroundStyle(.green)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.caption.bold())
                    .foregroundStyle(.secondary)
                    .frame(width: 30, height: 30)
                    .background(Color.gray.opacity(0.1))
                    .clipShape(Circle())
            }
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color(.systemBackground))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.gray.opacity(0.12), lineWidth: 1)
        )
        .shadow(
            color: .black.opacity(0.05),
            radius: 8,
            x: 0,
            y: 3
        )
        .padding(.horizontal)
        .padding(.vertical, 6)
    }
}
