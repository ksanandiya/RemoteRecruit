//
//  HTMLTextView.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 17/06/26.
//

import SwiftUI

struct HTMLTextView: View {
    
    let htmlString: String
    
    var body: some View {
        if let attributedString = try? AttributedString(htmlData: Data(htmlString.utf8)) {
            Text(attributedString)
        } else {
            Text(htmlString)
        }
    }
}
