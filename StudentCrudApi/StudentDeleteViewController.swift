//
//  StudentDeleteViewController.swift
//  StudentCrudApi
//
//  Created by Apple on 24/08/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class StudentDeleteViewController: UIViewController {

    @IBOutlet weak var Txtstid: UITextField!
    @IBAction func BtnStudentdelete(_ sender: Any) {
        API_StudentDelete()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    func API_StudentDelete(){
        let url = "https://akashsir.in/myapi/student/api/student-delete-api.php"
        let param:Parameters = ["st_id":Txtstid.text!]
        AF.request(url, method: .post, parameters: param).responseJSON{
            (response) in
            switch response.result{
            case .success:
                let responseData = JSON(response.data!)
                print(responseData)
                
                break
            case .failure:
                break
            }
        }
    }
}
