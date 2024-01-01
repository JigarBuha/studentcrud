//
//  StudentEditViewController.swift
//  Pods
//
//  Created by Apple on 24/08/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class StudentEditViewController: UIViewController {

    @IBOutlet weak var Txtstid: UITextField!
    @IBOutlet weak var Txtstname: UITextField!
    @IBOutlet weak var Txtstgender: UITextField!
    @IBOutlet weak var Txtstemail: UITextField!
    @IBOutlet weak var Txtstmobileno: UITextField!
    @IBAction func BtnStudentEdit(_ sender: Any) {
        API_StudentEdit()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func API_StudentEdit(){
        let url = "https://jigar.in/myapi/student/api/student-edit-api.php"
        let param:Parameters = ["st_id":Txtstid.text!,
                                "st_name":Txtstname.text!,
                                "st_gender":Txtstgender.text!,
                                "st_email":Txtstemail.text!,
                                "st_mobileno":Txtstmobileno.text!]
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
