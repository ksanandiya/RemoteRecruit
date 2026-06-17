//
//  String.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 17/06/26.
//

import Foundation
import UIKit
extension String {
    
    var htmlToAttributedString: AttributedString {
        guard let data = data(using: .utf8),
              let attributedString = try? NSAttributedString(
                data: data,
                options: [
                    .documentType: NSAttributedString.DocumentType.html,
                    .characterEncoding: String.Encoding.utf8.rawValue
                ],
                documentAttributes: nil
              )
        else {
            return AttributedString(self)
        }
        
        return AttributedString(attributedString)
    }
}
