//
//  ErrorViewModifier.swift
//  ErrorAndValidationV1
//
//  Created by Marquavious Draggon on 2/5/26.
//

import Foundation
import SwiftUI

// Extracted the View so all view can use this view as a error view
// Now all you have to do is update the style in one place
struct ErrorViewModifier: ViewModifier {

	@State private var errorWrapper: LISFErrorWrapper?

	func body(content: Content) -> some View {
		content
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.overlay(alignment: .bottom) {
				errorWrapper != nil ? LISFErrorView(errorWrapper: $errorWrapper) : nil
			}
			.environment(\.showError, ShowErrorAction(action: showError))
	}
	
	private func showError(_ error: Error, guidance: String) {
		errorWrapper = LISFErrorWrapper(error: error, guidance: guidance)
	}
}
