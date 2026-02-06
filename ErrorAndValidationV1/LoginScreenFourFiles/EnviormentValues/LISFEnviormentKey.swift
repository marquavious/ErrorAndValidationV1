//
//  LISFEnviormentKey.swift
//  ErrorAndValidationV1
//
//  Created by Marquavious Draggon on 2/5/26.
//

import Foundation
import SwiftUI

// We want to be able to call this in any view
// showError(Error, String)

struct ShowErrorAction {
	typealias Action = (Error, String) -> ()
	let action: Action

	// We do this becuase we want to use the ENV in clousres
	// without memeory issues
	func callAsFunction(_ error: Error, _ guidance: String) {
		action(error, guidance)
	}
}

extension EnvironmentValues {
	@Entry var showError: ShowErrorAction = ShowErrorAction { _, _ in }
}
