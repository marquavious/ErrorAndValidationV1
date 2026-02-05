//
//  LoginScreenTwo.swift
//  ErrorAndValidationV1
//
//  Created by Marquavious Draggon on 2/2/26.
//

import SwiftUI

// Config for seperation
struct LoginScreenTwoConfig {

	var firstName: String = ""
	var lastName: String = ""
	var ssn: String = ""
	var street: String = ""
	var city: String = ""
	var state: String = ""
	var zipcode: String = ""

	var errorMessages: [FormErrors] = []

	mutating func validate() -> Bool {
		errorMessages.removeAll()

		if firstName.isEmpty {
			errorMessages.append(.firstName)
		}

		if lastName.isEmpty {
			errorMessages.append(.lastName)
		}

		if ssn.isEmpty {
			errorMessages.append(.ssn)
		} else if !ssn.isSSNValid() {
			errorMessages.append(.ssn)
		}

		if street.isEmpty {
			errorMessages.append(.street)
		}

		if city.isEmpty {
			errorMessages.append(.city)
		}

		if state.isEmpty {
			errorMessages.append(.state)
		}

		if zipcode.isEmpty {
			errorMessages.append(.zipcode)
		}

		return errorMessages.isEmpty
	}
}

// Come back to this
enum LoginScreenTwoAction {
	case submitButtonPressed
}

struct LoginScreenTwo: View {
	@State private var loginScreen = LoginScreenTwoConfig()

	var body: some View {
		VStack {
			InputForm(loginScreen: $loginScreen) {
				handleLoginAction(action: $0)
			}
			ValidationSummaryView(
				errorMessages: loginScreen.errorMessages
			)
		}
	}

	private func handleLoginAction(action: LoginScreenTwoAction) {
		switch action {
		case .submitButtonPressed:
			print("Submit Button Pressed")
		}
	}
}

struct InputForm: View {

	@Binding var loginScreen: LoginScreenTwoConfig

	var handleAction: (LoginScreenTwoAction) -> Void

	var body: some View {
		Form {
			Section(header: Text("Personal Information")) {
				TextField("First Name", text: $loginScreen.firstName)
				TextField("Last Name", text: $loginScreen.lastName)
				TextField("SSN", text: $loginScreen.ssn)
					.keyboardType(.numberPad)
			}

			Section(header: Text("Address")) {
				TextField("Street", text: $loginScreen.street)
				TextField("City", text: $loginScreen.city)
				TextField("State", text: $loginScreen.state)
				TextField("Zipcode", text: $loginScreen.zipcode)
					.keyboardType(.numberPad)
			}

			Button("Submit") {
				if loginScreen.validate() {
					// Submit Code - all fields are valid
					print("Form is valid!")
				}
			}
		}
	}
}

#Preview {
	LoginScreenTwo()
}

#Preview("Spanish") {
	LoginScreenTwo()
		.environment(\.locale, Locale(identifier: "es"))
}
