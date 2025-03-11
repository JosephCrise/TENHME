//
//  PhoneNumberInputVC.swift
//  TENHME
//
//  Created by Sam Sophanna on 3/11/25.
//

import UIKit

class PhoneNumberInputVC: UIViewController {

    
    @IBOutlet weak var ImageViewBack   : UIImageView!
    @IBOutlet weak var titlelabel      : UILabel!
    @IBOutlet weak var subTitleLabel   : UILabel!
    @IBOutlet weak var codeCountryLable: UILabel!
    
    @IBOutlet weak var numberPhoneTextField: UITextField!
    
    @IBOutlet weak var goToInputPIN: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionOnBackImageview()
        actionGotoPINImageview()
        costumTitleLabel()
    }
    
    func costumTitleLabel(){
        titlelabel.font = UIFont(name: "Gilroy-SemiBold", size: 26)
        subTitleLabel.font = UIFont(name: "Gilroy-SemiBold", size: 16)
        titlelabel.font = UIFont(name: "Gilroy-SemiBold", size: 26)
        codeCountryLable.font = UIFont(name: "Gilroy-SemiBold", size: 18)
        numberPhoneTextField.font = UIFont(name: "Gilroy-SemiBold", size: 18)
    }
    
    func actionOnBackImageview(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(BackImageTapped))
        ImageViewBack.isUserInteractionEnabled = true
        ImageViewBack.addGestureRecognizer(tapGesture)
    }
    
    func actionGotoPINImageview(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(GoToPINimageTapped))
        goToInputPIN.isUserInteractionEnabled = true
        goToInputPIN.addGestureRecognizer(tapGesture)
    }
    
    @objc func BackImageTapped() {
        let vc = self.navigationController?.viewControllers.first(where: {$0.isKind(of: LoginVC.self)}) as! LoginVC
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @objc func GoToPINimageTapped() {
        self.push(storyboardName: "PINSB", viewControllerID: "PINVC")
    }
}
