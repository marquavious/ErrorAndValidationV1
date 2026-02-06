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
