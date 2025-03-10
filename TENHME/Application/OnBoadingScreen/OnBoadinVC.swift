//
//  OnBoadinVC.swift
//  TENHME
//
//  Created by Sam Sophanna on 3/10/25.
//

import UIKit

class OnBoadinVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func getStartedAct(_ sender: Any) {
        // Save that the user has seen the intro
        UserDefaults.standard.set(true, forKey: "hasSeenIntro")
        
        // Navigate to Login Screen
        self.presentScreen(to: "LoginVC", storyboardName: "LoginSB")
    }
}
//
