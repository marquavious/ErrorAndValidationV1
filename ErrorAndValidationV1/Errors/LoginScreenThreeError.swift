//
//  LoginScreenThreeError.swift
//  ErrorAndValidationV1
//
//  Created by Marquavious Draggon on 2/5/26.
//

import SwiftUI
import Foundation

enum LoginScreenThreeError: Error, LocalizedError {
	case invalidCredentials

	var errorDescription: String? {
		switch self {
		case .invalidCredentials:
			NSLocalizedString("Invalid Credentials", comment: "Invalid Credentials Login Screen error")
		}
	}
}
