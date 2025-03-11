//
//  SelectLocationVC.swift
//  TENHME
//
//  Created by Sam Sophanna on 3/11/25.
//

import UIKit

class SelectLocationVC: UIViewController {

    @IBOutlet weak var backImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actionOnBackImageview()
        
        // Do any additional setup after loading the view.
    }
    
    func actionOnBackImageview(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(BackImageTapped))
        backImageView.isUserInteractionEnabled = true
        backImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func BackImageTapped() {
        self.navigationController?.popViewController(animated: true)
    }


}
