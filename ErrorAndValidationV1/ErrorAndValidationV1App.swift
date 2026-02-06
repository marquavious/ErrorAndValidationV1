//
//  ErrorAndValidationV1App.swift
//  ErrorAndValidationV1
//
//  Created by Marquavious Draggon on 2/2/26.
//

import SwiftUI

@main
struct ErrorAndValidationV1App: App {

	@State private var errorWrapper: LISFErrorWrapper?

	var body: some Scene {
		WindowGroup {
			NavigationStack {

				/* Uncomment the Log in Screen you would like to test here
				 LoginScreenOne()
				 LoginScreenTwo()
				 LoginScreenThree()
				 */

				// This Screen shoes the power of global error handling
				LoginScreenFour()
			}

			// The magic line for global error handling
			.withErrorView()
		}
	}
}
