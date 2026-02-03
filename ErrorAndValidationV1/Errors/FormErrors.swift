//
//  FormErrors.swift
//  ErrorAndValidationV1
//
//  Created by Marquavious Draggon on 2/2/26.
//

import Foundation

enum FormErrors: LocalizedError, Identifiable {
	case firstName
	case lastName
	case ssn
	case street
	case city
	case state
	case zipcode
	
	var id: Self { self }

	var errorDescription: String? {
		switch self {
		case .firstName:
			NSLocalizedString("First Name Cannot Be Empty", comment: "")
		case .lastName:
			NSLocalizedString("Last Name Cannot Be Empty", comment: "")
		case .ssn:
			NSLocalizedString("SSN Must Be In Format XXX-XX-XXXX", comment: "")
		case .street:
			NSLocalizedString("Street Cannot Be Empty", comment: "")
		case .city:
			NSLocalizedString("City Cannot Be Empty", comment: "")
		case .state:
			NSLocalizedString("State Cannot Be Empty", comment: "")
		case .zipcode:
			NSLocalizedString("Zipcode Cannot Be Empty", comment: "")
		}
	}
}
