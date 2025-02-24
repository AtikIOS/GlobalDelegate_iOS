//
//  ViewController.swift
//  GlobalDelegate
//
//  Created by Atik Hasan on 2/24/25.
//

import UIKit

class SecondViewController: UIViewController {

    var countryArray : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadCountriesFromJSON()
    }
    
    
    static func getVewController() -> SecondViewController {
        return UIStoryboard(name: "SecondViewController", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
    }

    
    func loadCountriesFromJSON() {
        if let path = Bundle.main.path(forResource: "CountryName", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let countryArray = jsonResult as? [String] {
                    print(countryArray)
                    self.countryArray = countryArray
                }
            } catch {
                print("Error loading countries")
            }
        }
    }
    
    @IBAction func showCountryList(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Select a Country", message: nil, preferredStyle: .actionSheet)
        
        for country in countryArray {
            let action = UIAlertAction(title: country, style: .default) { _ in
                print("Selected Country: \(country)")
                /// pass selected Country
                GlobalDelegateManager.shared.countryName = country  /// store data in variable
                GlobalDelegateManager.shared.countryDelegate?.didSelectCountry(country)
                self.navigationController?.popViewController(animated: true)
            }
            alertController.addAction(action)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        if let popoverController = alertController.popoverPresentationController {
            popoverController.sourceView = sender
               popoverController.sourceRect = sender.bounds
           }

           present(alertController, animated: true, completion: nil)
       }
}

