//
//  ErrorViewModifier.swift
//  ErrorAndValidationV1
//
//  Created by Marquavious Draggon on 2/5/26.
//

import Foundation
import SwiftUI

struct ErrorViewModifier: ViewModifier {

	@State private var errorWrapper: LoginScreenFourErrorWrapper?

	func body(content: Content) -> some View {
		content
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.overlay(alignment: .bottom) {
				errorWrapper != nil ? LISFErrorView(errorWrapper: $errorWrapper) : nil
			}
			.environment(\.showError, ShowErrorAction(action: showError))
	}
	
	private func showError(_ error: Error, guidance: String) {
		errorWrapper = LoginScreenFourErrorWrapper(error: error, guidance: guidance)
	}
}
