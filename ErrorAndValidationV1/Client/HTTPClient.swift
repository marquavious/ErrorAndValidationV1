//
//  HTTPClient.swift
//  ErrorAndValidationV1
//
//  Created by Marquavious Draggon on 2/5/26.
//

import Foundation

// Fake HTTPClient to simulate error throwing
struct HTTPClient {
	func login(username: String, password: String) async throws {
		throw LoginScreenThreeError.invalidCredentials
	}
}
