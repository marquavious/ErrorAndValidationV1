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

	var errorMessages: [String] = []

	mutating func validate() -> Bool {
		errorMessages.removeAll()

		if firstName.isEmpty {
			errorMessages.append("First Name is not valid")
		}

		if lastName.isEmpty {
			errorMessages.append("Last Name is not valid")
		}

		if ssn.isEmpty {
			errorMessages.append("SSN is required")
		} else if !ssn.isSSNValid() {
			errorMessages.append("SSN must be in format XXX-XX-XXXX")
		}

		if street.isEmpty {
			errorMessages.append("Street is not valid")
		}

		if city.isEmpty {
			errorMessages.append("City is not valid")
		}

		if state.isEmpty {
			errorMessages.append("State is not valid")
		}

		if zipcode.isEmpty {
			errorMessages.append("Zipcode is not valid")
		}

		return errorMessages.isEmpty
	}
}

// Come back to this
enum LoginActions {
	case submitButtonPressed
}

struct LoginScreenTwo: View {
	@State private var loginScreen = LoginScreenTwoConfig()

	var body: some View {
		InputForm(loginScreen: $loginScreen) {
			handleLoginAction(action: $0)
		}
		FormValidationView(
			errorMessages: loginScreen.errorMessages
		)
	}

	private func handleLoginAction(action: LoginActions) {
		switch action {
		case .submitButtonPressed:
			print("Submit Button Pressed")
		}
	}
}

struct InputForm: View {

	@Binding var loginScreen: LoginScreenTwoConfig

	var handleAction: (LoginActions) -> Void

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

struct FormValidationView: View {

	var errorMessages: [String]

	var body: some View {
		ForEach(errorMessages, id: \.self) { errorMessage in
			Text(errorMessage)
				.foregroundStyle(.red)
		}
	}
}

#Preview {
	LoginScreenTwo()
}
