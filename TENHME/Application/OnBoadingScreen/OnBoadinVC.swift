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
    


    @IBAction func getStartedAct(_ sender: UIButton) {
        // Save that the user has seen the intro
        UserDefaults.standard.set(true, forKey: "hasSeenIntro")
        // Navigate to Login Screen
        self.animateButton(button: sender, scale: 0.85) {
            self.push(storyboardName: "LoginSB", viewControllerID: "LoginVC")
        }
    }
}
