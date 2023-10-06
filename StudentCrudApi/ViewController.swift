//
//  ViewController.swift
//  StudentCrudApi
//
//  Created by Apple on 24/08/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var Txtstudentemail: UITextField!
    @IBOutlet weak var Txtstudentpassword: UITextField!
    @IBAction func BtnLogin(_ sender: Any) {
        API_StudentLogin()
    }
    @IBAction func BtnNewAccount(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func API_StudentLogin(){
        let url = "https://akashsir.in/myapi/student/api/student-login-api.php"
        let param:Parameters = ["st_email":Txtstudentemail.text!,
                                "st_password":Txtstudentpassword.text!]
        AF.request(url, method: .post, parameters: param).responseJSON{
            (response) in
            switch response.result{
            case .success:
                let responseData = JSON(response.data!)
                print(responseData)
                
                var token = responseData["access_token"];
                var mynewtoken = "\(token)"
                print(mynewtoken)
                UserDefaults.standard.set(mynewtoken, forKey: "utoken")
                break
            case .failure:
                break
            }
        }
    }
}

