//
//  PINVC.swift
//  TENHME
//
//  Created by Sam Sophanna on 3/11/25.
//

import UIKit

class PINVC: UIViewController {
    
    @IBOutlet weak var backImageView : UIImageView!
    @IBOutlet weak var subTitleLabel : UILabel!
    @IBOutlet weak var TitleLabel    : UILabel!
    
    @IBOutlet weak var gotoMapImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        costumTitleLabel()
        actionOnBackImageview()
        actionGotoChooseLocation()
        // Do any additional setup after loading the view.
    }
    
    func costumTitleLabel(){
        TitleLabel.font    = UIFont(name: "Gilroy-SemiBold", size: 26)
        subTitleLabel.font = UIFont(name: "Gilroy-SemiBold", size: 16)
    }

    func actionOnBackImageview(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(BackImageTapped))
        backImageView.isUserInteractionEnabled = true
        backImageView.addGestureRecognizer(tapGesture)
    }
    func actionGotoChooseLocation(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(GoToMapTapped))
        gotoMapImageView.isUserInteractionEnabled = true
        gotoMapImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func BackImageTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func GoToMapTapped() {
        self.push(storyboardName: "SelectLocationSB", viewControllerID: "SelectLocationVC")
    }
}
