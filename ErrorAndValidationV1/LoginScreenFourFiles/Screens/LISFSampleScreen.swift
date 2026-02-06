//
//  LISFSampleScreen.swift
//  ErrorAndValidationV1
//
//  Created by Marquavious Draggon on 2/5/26.
//

import SwiftUI

struct LISFSampleScreen: View {

	@Environment(\.showError) private var showError

	var body: some View {
		Button("Show Error using screen modifier") {
			showError(LISFSampleError.operationFailed, "Operation Failed")
		}
		.buttonStyle(.borderedProminent)
		.navigationBarTitle("Screen Two")
	}
}

#Preview {
	LISFSampleScreen()
}
