//
//  LoginVC.swift
//  TENHME
//
//  Created by Sam Sophanna on 3/10/25.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        initTableView()
        // Do any additional setup after loading the view.
        setNavigationBarStyle(isHidden: true, animated: true, title: "")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func navigateToInputNumberPhoneAct(_ sender: UIButton) {
        //navigate to screen input phone number
        self.push(storyboardName: "PhoneNumberInputSB", viewControllerID: "PhoneNumberInputVC")
    }
    
}
