//
//  LoginScreenFourErrorWrapper.swift
//  ErrorAndValidationV1
//
//  Created by Marquavious Draggon on 2/5/26.
//

import Foundation

struct LoginScreenFourErrorWrapper: Identifiable {
	let id = UUID()
	let error: Error
	let guidance: String
}
