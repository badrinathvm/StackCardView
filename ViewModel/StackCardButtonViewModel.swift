//
//  StackCardButtonViewModel.swift
//  StackCardView
//
//  Created by Rani Badri on 1/29/24.
//

import Foundation
import Combine

class StackCardButtonProperties: ObservableObject {
    @Published var buttons: (left: String, right: String) = ("", "")
}
