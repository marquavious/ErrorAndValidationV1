//
//  LISFErrorView.swift
//  ErrorAndValidationV1
//
//  Created by Marquavious Draggon on 2/5/26.
//

import SwiftUI

struct LISFErrorView: View {

	@Binding var errorWrapper: LISFErrorWrapper?

	var body: some View {
		VStack {
			if let errorWrapper {
				Text(errorWrapper.guidance)
					.foregroundStyle(.white)
					.padding(10)
					.background(.red)
					.cornerRadius(10)
			}
		}
		// Show errors on timer and manage showing multiple calls
		.task(id: errorWrapper?.id) {
			try? await Task.sleep(for: .seconds(2))
			guard !Task.isCancelled else {
				return
			}

			errorWrapper = nil
		}
	}
}

#Preview("With Error") {
	@Previewable @State var errorWrapper: LISFErrorWrapper? = LISFErrorWrapper(
		error: NSError(domain: "com.example.error", code: 401, userInfo: [NSLocalizedDescriptionKey: "Authentication failed"]),
		guidance: "Invalid username or password. Please try again."
	)
	
	LISFErrorView(errorWrapper: $errorWrapper)
}

#Preview("No Error") {
	@Previewable @State var errorWrapper: LISFErrorWrapper? = nil
	
	LISFErrorView(errorWrapper: $errorWrapper)
}
