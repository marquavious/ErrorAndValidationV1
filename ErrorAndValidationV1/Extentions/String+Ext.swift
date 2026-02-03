//
//  String+Ext.swift
//  ErrorAndValidationV1
//
//  Created by Marquavious Draggon on 2/2/26.
//

import Foundation

extension String {
	func isSSNValid() -> Bool {
		let ssnRegex = "^\\d{3}-\\d{2}-\\d{4}$"
		let ssnPredicate = NSPredicate(format: "SELF MATCHES %@", ssnRegex)
		return ssnPredicate.evaluate(with: self)
	}
}
