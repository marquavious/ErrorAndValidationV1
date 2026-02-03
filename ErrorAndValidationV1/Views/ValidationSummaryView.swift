//
//  ValidationSummaryView.swift
//  ErrorAndValidationV1
//
//  Created by Marquavious Draggon on 2/2/26.
//

import SwiftUI

struct ValidationSummaryView: View {

	var errorMessages: [FormErrors]

	var body: some View {
		ForEach(errorMessages) { errorMessage in
			Text(errorMessage.localizedDescription)
				.foregroundStyle(.red)
		}
	}
}

#Preview {
	ValidationSummaryView(errorMessages: [.city, .zipcode])
}
