//
//  ErrorAndValidationV1App.swift
//  ErrorAndValidationV1
//
//  Created by Marquavious Draggon on 2/2/26.
//

import SwiftUI

@main
struct ErrorAndValidationV1App: App {

	@State private var errorWrapper: LoginScreenFourErrorWrapper?

	var body: some Scene {
		WindowGroup {
			
			// Enter Log in Screen you would like to test here
			// LoginScreenOne()

			NavigationStack {
				LoginScreenFour()
					.withErrorView()
			}
			/*
				.environment(\.showError, ShowErrorAction(action: showError))
				.sheet(item: $errorWrapper) { errorWrapper in
					Text(errorWrapper.guidance)
				}
			*/
		}
	}

	private func showError(error: Error, guidance: String) {
		errorWrapper = LoginScreenFourErrorWrapper(error: error, guidance: guidance)
	}
}
