//
//  String.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 17/06/26.
//

import Foundation
import UIKit
extension AttributedString {
    init(htmlData: Data) throws {
        let nsAttributedString = try NSAttributedString(
            data: htmlData,
            options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue],
            documentAttributes: nil
        )
        self.init(nsAttributedString)
    }
}
