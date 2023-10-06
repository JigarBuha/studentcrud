//
//  StudentlistViewController.swift
//  StudentCrudApi
//
//  Created by Apple on 24/08/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class StudentlistViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_st_name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stlistcell") as! StudentlistTableViewCell
        cell.lblstudentid.text = arr_st_id[indexPath.row]
        cell.lblstudentname.text = arr_st_name[indexPath.row]
        cell.lblstudentgender.text = arr_st_gender[indexPath.row]
        cell.lblstudentemail.text = arr_st_email[indexPath.row]
        cell.lblstudentmobileno.text = arr_st_mobileno[indexPath.row]
       
        
       let url = URL(string: arr_st_photo[indexPath.row])
       cell.Stimageview.af.setImage(withURL: url!)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let main = storyboard?.instantiateViewController(identifier: "StudentDetailsViewController") as! StudentDetailsViewController
        main.st_id = arr_st_id[indexPath.row]
        main.st_name = arr_st_name[indexPath.row]
        main.st_gender = arr_st_gender[indexPath.row]
        main.st_email = arr_st_email[indexPath.row]
        main.st_mobileno = arr_st_mobileno[indexPath.row]
        main.st_photo = arr_st_photo[indexPath.row]
        self.navigationController?.pushViewController(main, animated: true)
    }
    @IBOutlet weak var lbltoken: UILabel!
    @IBOutlet weak var MyTableView: UITableView!
    
    var arr_st_id = [String]()
    var arr_st_name = [String]()
    var arr_st_gender = [String]()
    var arr_st_email = [String]()
    var arr_st_mobileno = [String]()
    var arr_st_photo = [String]()
    var mytoken = ""
    override func viewDidLoad() {
        
        print("under ayo")
        super.viewDidLoad()
        
        
        MyTableView.delegate = self
        MyTableView.dataSource = self
        if((UserDefaults.standard.string(forKey: "utoken") ) != nil){
            mytoken = UserDefaults.standard.string(forKey: "utoken")!
            print("Token Found : \(mytoken)")
        }else{
            print("Token Not Found")
        }
        API_StudentList()
    }
    func API_StudentList(){
         
        let headers: HTTPHeaders = [.authorization(bearerToken: mytoken)]

        let url = "https://akashsir.in/myapi/student/api/student-list-api.php"
        AF.request(url, method: .get,headers: headers).responseJSON{(response)in
            switch response.result{
            case .success:
                let myresult = try? JSON(data: response.data!)
                print(response.result)
                
                let resultArray = myresult!["student_list"]
                self.arr_st_id.removeAll()
                self.arr_st_name.removeAll()
                self.arr_st_gender.removeAll()
                self.arr_st_email.removeAll()
                self.arr_st_mobileno.removeAll()
                self.arr_st_photo.removeAll()
                
                for i in resultArray.arrayValue{
                    let st_id = i["st_id"].stringValue
                    self.arr_st_id.append(st_id)
                    
                    let st_name = i["st_name"].stringValue
                    self.arr_st_name.append(st_name)
                    
                    let st_gender = i["st_gender"].stringValue
                    self.arr_st_gender.append(st_gender)
                    
                    let st_email = i["st_email"].stringValue
                    self.arr_st_email.append(st_email)
                    
                    let st_mobileno = i["st_mobileno"].stringValue
                    self.arr_st_mobileno.append(st_mobileno)
                    
                    let st_photo = i["st_photo"].stringValue
                    self.arr_st_photo.append(st_photo)
                    
                    print(st_id)
                    print(st_name)
                    print(st_gender)
                    print(st_email)
                    print(st_mobileno)
                    print(st_photo)
        
                }
                self.MyTableView.reloadData()
                break
                
            case .failure:
                break
            }
        
        }
    }

}



