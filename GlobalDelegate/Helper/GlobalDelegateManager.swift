//
//  GlobalDelegateManager.swift
//  GlobalDelegate
//
//  Created by Atik Hasan on 2/24/25.
//

import Foundation

class GlobalDelegateManager {
    static let shared = GlobalDelegateManager()
    var countryName: String?        /// this variable for store data
    weak var countryDelegate: CountryDelegate?
}

protocol CountryDelegate: AnyObject {
    func didSelectCountry(_ country: String)
}




