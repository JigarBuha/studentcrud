//
//  StudentaddViewController.swift
//  StudentCrudApi
//
//  Created by Apple on 24/08/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class StudentaddViewController: UIViewController {

    @IBOutlet weak var Txtstudentname: UITextField!
    @IBOutlet weak var Txtstudentgender: UITextField!
    @IBOutlet weak var Txtstudentemail: UITextField!
    @IBOutlet weak var Txtstudentmobileno: UITextField!
    @IBOutlet weak var Txtstudentpassword: UITextField!
    @IBAction func BtnStudentAdd(_ sender: Any) {
        if validate{
            API_StudentAdd()
         }
       
        let varstname = Txtstudentname.text
        let varstgender = Txtstudentgender.text
        let varstemail = Txtstudentemail.text
        let varstmobileno = Txtstudentmobileno.text
        let varstpassword = Txtstudentpassword.text
        
        let pref = UserDefaults.standard
        pref.setValue(varstname, forKey: "uname")
        pref.setValue(varstgender, forKey: "ugender")
        pref.setValue(varstemail, forKey: "uemail")
        pref.setValue(varstmobileno, forKey: "umobileno")
        pref.setValue(varstpassword, forKey: "upassword")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var validate:Bool{
        if Txtstudentname.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            let alert = UIAlertController(title: "Message", message: "Please enter name", preferredStyle: .alert)
            let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
            return false
        }
        if Txtstudentgender.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            let alert = UIAlertController(title: "Message", message: "Please enter gender", preferredStyle: .alert)
            let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
            return false
        }
        if Txtstudentemail.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            let alert = UIAlertController(title: "Message", message: "Please enter email", preferredStyle: .alert)
            let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
            return false
        }
        if Txtstudentmobileno.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            let alert = UIAlertController(title: "Message", message: "Please enter mobileno", preferredStyle: .alert)
            let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
            return false
        }
        if Txtstudentpassword.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            let alert = UIAlertController(title: "Message", message: "Please enter password", preferredStyle: .alert)
            let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
            return false
        }
        
        return true
    }
    
    func API_StudentAdd(){
        let url = "https://jigar.in/myapi/student/api/student-add-api.php"
        let param:Parameters = ["st_name":Txtstudentname.text!,
                                "st_gender":Txtstudentgender.text!,
                                "st_email":Txtstudentemail.text!,
                                "st_mobileno":Txtstudentmobileno.text!,
                                "st_password":Txtstudentpassword.text!]
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
