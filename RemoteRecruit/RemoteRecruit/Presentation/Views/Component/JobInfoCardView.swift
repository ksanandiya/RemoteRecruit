//
//  JobInfoCardView.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 19/06/26.
//

/// Reusable information card used on the Job Detail screen.
///
/// Displays:
/// - Icon
/// - Title
/// - Value
///
/// Used for presenting metadata such as
/// job location and salary.

import SwiftUI

struct JobInfoCardView: View {

    let icon: String
    let title: String
    let value: String
    let color: Color

    var body: some View {

        VStack(alignment: .leading, spacing: 8) {

            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(color)

            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)

            Text(value)
                .font(.subheadline.weight(.medium))
                .lineLimit(2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(color.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
