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
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//extension LoginVC : UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let rowTypes = LoginRowType.allCases[indexPath.row]
//        switch rowTypes {
//        case .TopImageLogin:
//            return UITableView.automaticDimension
//        case .TitleLogin:
//            return UITableView.automaticDimension
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        let rowTypes = LoginRowType.allCases[section]
////        switch rowTypes {
////        case .TopImageLogin:
////            return 0
////        case .TitleLogin:
////            return 1
////        }
//        return 2
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let rowTypes = LoginRowType.allCases[indexPath.row]
//        switch rowTypes {
//        case .TitleLogin:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleLoginTableViewCell", for: indexPath) as! TitleLoginTableViewCell
//            return cell
//        case .TopImageLogin:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "TopImageLoginTableViewCell", for: indexPath) as! TopImageLoginTableViewCell
//            return cell
//      
//        }
//    }
//    func initTableView(){
//        tableView.delegate = self
//        tableView.dataSource = self
//        self.tableView.register(UINib(nibName: "TitleLoginTableViewCell", bundle: nil), forCellReuseIdentifier: "TitleLoginTableViewCell")
//        self.tableView.register(UINib(nibName: "TopImageLoginTableViewCell", bundle: nil), forCellReuseIdentifier: "TopImageLoginTableViewCell")
//      
//        
// 
//        
//    }
//    
//}
