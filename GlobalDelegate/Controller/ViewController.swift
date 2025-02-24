//
//  SecondViewController.swift
//  GlobalDelegate
//
//  Created by Atik Hasan on 2/24/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblCountry : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        GlobalDelegateManager.shared.countryDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("country : ", GlobalDelegateManager.shared.countryName)

    }
    
    static func getVewController() -> ViewController {
        return UIStoryboard(name: "ViewController", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
    }

    @IBAction func btnTap() {
        let vc = SecondViewController.getVewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension ViewController : CountryDelegate {
    func didSelectCountry(_ country: String) {
        self.lblCountry.text = country
    }
}

