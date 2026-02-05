//
//  LoginScreenThree.swift
//  ErrorAndValidationV1
//
//  Created by Marquavious Draggon on 2/5/26.
//

import SwiftUI

enum LoginScreenThreeError: Error, LocalizedError {
	case invalidCredentials

	var errorDescription: String? {
		switch self {
		case .invalidCredentials:
			NSLocalizedString("Invalid Credentials", comment: "Invalid Credentials Login Screen error")
		}
	}
}

struct LoginScreenThreeConfig {

	var username: String = ""
	var password: String = ""

	var isvalid: Bool {
		!username.isEmpty && !password.isEmpty
	}
}

struct LoginScreenThree: View {

	@State private var errorWrapper: ErrorWrapper? = nil
	@State private var loginScreenOneConfig = LoginScreenOneConfig()
	@State private var isLoggingIn: Bool = false

	private let httpClient = HTTPClient()

	private func login() async {
		do {
			try await httpClient.login(username: loginScreenOneConfig.username, password: loginScreenOneConfig.password)
		} catch {
			// Handle Error
			errorWrapper = ErrorWrapper(error: error, guidance: NSLocalizedString("Please check your username and password", comment: "Login Screen error"))
		}
	}

	var body: some View {
		Form {
			Section(header: Text("Login")) {
				TextField("Username", text: $loginScreenOneConfig.username)
				SecureField("Password", text: $loginScreenOneConfig.password)
			}

			Button("Login") {
				/*
				 If this view gets created again, the call will never complete.
				 This is why we are not placing the code here
				 Task {
				 httpClient.login(username: loginScreenOneConfig.username, password: loginScreenOneConfig.password)
				 }
				 */

				// Toggle this value instead
				isLoggingIn = true
			}
			.task(id: isLoggingIn) {
				/*
				 Here we use the boolean to check, that way when the view is recreated
				 we aren't spamming calls.
				 */
				if isLoggingIn {
					await login()
				}
				isLoggingIn = false
			}
			.disabled(!loginScreenOneConfig.isvalid)
		}
		.sheet(item: $errorWrapper) { error in
			ErrorView(errorWrapper: error)
		}
	}
}

#Preview {
	LoginScreenThree()
}
