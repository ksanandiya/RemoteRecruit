//
//  JobDetailHeaderView.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 19/06/26.
//

/// Displays the header section of the Job Detail screen.
///
/// Includes:
/// - Job title
/// - Company information
/// - Job category badge
/// - Location summary
/// - Salary summary
///
/// Designed as a reusable component to keep
/// `JobDetailView` clean and modular.

import SwiftUI

struct JobDetailHeaderView: View {

    let job: Job

    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            HStack(alignment: .top, spacing: 16) {

                ZStack {

                    Circle()
                        .fill(Color.blue.opacity(0.15))
                        .frame(width: 64, height: 64)

                    Image(systemName: "building.2.fill")
                        .font(.title)
                        .foregroundStyle(.blue)
                }

                VStack(alignment: .leading, spacing: 8) {

                    Text(job.title)
                        .font(.title2.bold())

                    Text(job.companyName)
                        .font(.headline)
                        .foregroundStyle(.secondary)

                    Text(job.category)
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.blue)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(Color.blue.opacity(0.12))
                        .clipShape(Capsule())
                }

                Spacer()
            }

            Divider()

            HStack(spacing: 12) {

                JobInfoCardView(
                    icon: "mappin.and.ellipse",
                    title: "Location",
                    value: job.location,
                    color: .blue
                )

                JobInfoCardView(
                    icon: "dollarsign.circle.fill",
                    title: "Salary",
                    value: job.salary.isEmpty
                    ? "Not disclosed"
                    : job.salary,
                    color: .green
                )
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(
            color: .black.opacity(0.05),
            radius: 8,
            y: 4
        )
    }
}
