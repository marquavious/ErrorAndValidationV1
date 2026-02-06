//
//  LoginScreenFour.swift
//  ErrorAndValidationV1
//
//  Created by Marquavious Draggon on 2/5/26.
//

import SwiftUI

struct LoginScreenFour: View {

	@Environment(\.showError) private var showError

	var body: some View {
		VStack(spacing: 18) {
				Button("Throw error") {
					showError(LISFSampleError.operationFailed, "Operation Failed please try again later.")
				}

				NavigationLink("Show another screen to display global error") {
					LISFSampleScreen()
						.withErrorView()
				}
			}
			.padding()
	}
}

// Only created for previews
struct ContentViewContainer: View {

	@State private var errorWrapper: LISFErrorWrapper?

	var body: some View {
		NavigationStack {
			LoginScreenFour()
		}
		.withErrorView()
	}
}

#Preview {
	NavigationStack {
		ContentViewContainer()
	}
}
