//
//  LoginScreenOne.swift
//  ErrorAndValidationV1
//
//  Created by Marquavious Draggon on 2/2/26.
//

import SwiftUI

// Config for seperation
struct LoginScreenOneConfig {

	var username: String = ""
	var password: String = ""

	var isvalid: Bool {
		!username.isEmpty && !password.isEmpty
	}
}

struct LoginScreenOne: View {

	@State private var loginScreenOneConfig = LoginScreenOneConfig()

	var body: some View {
		Form {
			Section(header: Text("Login")) {
				TextField("Username", text: $loginScreenOneConfig.username)
				TextField("Password", text: $loginScreenOneConfig.password)
			}

			Button("Login") {
				// Log in Code
			}
			.disabled(!loginScreenOneConfig.isvalid)
		}
	}
}

#Preview {
	LoginScreenOne()
}
