//
//  JobDetailViewModel.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 17/06/26.
//

import SwiftUI
import Combine

@MainActor
final class JobDetailViewModel: ObservableObject {

    let job: Job

    init(job: Job) {
        self.job = job
    }
}
