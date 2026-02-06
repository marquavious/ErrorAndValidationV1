//
//  View+Extentions.swift
//  ErrorAndValidationV1
//
//  Created by Marquavious Draggon on 2/5/26.
//


import SwiftUI
import Foundation


extension View {
	func withErrorView() -> some View {
		modifier(ErrorViewModifier())
	}
}
