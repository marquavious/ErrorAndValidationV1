//
//  ErrorView.swift
//  ErrorAndValidationV1
//
//  Created by Marquavious Draggon on 2/5/26.
//

import SwiftUI

struct ErrorView: View {
	var errorWrapper: ErrorWrapper
	
	var body: some View {
		VStack {
			Text(errorWrapper.error.localizedDescription)
			Text(errorWrapper.guidance)
		}
	}
}
