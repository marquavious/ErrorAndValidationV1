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
			VStack {
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

	@State private var errorWrapper: LoginScreenFourErrorWrapper?

	var body: some View {
		NavigationStack {
			LoginScreenFour()
		}
		.withErrorView()
		/*
		 .environment(\.showError, ShowErrorAction(action: showError))
		.overlay(alignment: .bottom) {
			errorWrapper != nil ? LISFErrorView(errorWrapper: $errorWrapper) : nil
		}
		*/
	}

	/* This is one way to show it over a screen
	 .sheet(item: $errorWrapper) { errorWrapper in
	 Text(errorWrapper.guidance)
	 }

	 NavigationLink("Show another screen") {
	 LISFSampleScreen()
	 }
	 */

	private func showError(error: Error, guidance: String) {
		errorWrapper = LoginScreenFourErrorWrapper(error: error, guidance: guidance)
	}
}

#Preview {
	NavigationStack {
		ContentViewContainer()
	}
}


struct LISFErrorView: View {

	@Binding var errorWrapper: LoginScreenFourErrorWrapper?

	var body: some View {
		VStack {
			if let errorWrapper {
				Text(errorWrapper.guidance)
			}
		}
		.task(id: errorWrapper?.id) {
			try? await Task.sleep(for: .seconds(2))
			guard !Task.isCancelled else {
				return
			}

			errorWrapper = nil
		}
	}
}
