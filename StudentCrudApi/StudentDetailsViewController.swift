//
//  StudentDetailsViewController.swift
//  StudentCrudApi
//
//  Created by Apple on 24/08/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class StudentDetailsViewController: UIViewController{
  

    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var lblstid: UILabel!
    @IBOutlet weak var lblstgender: UILabel!
    @IBOutlet weak var lblstemail: UILabel!
    @IBOutlet weak var lblstname: UILabel!
    @IBOutlet weak var lblstmobileno: UILabel!
    var st_id = ""
    var st_name = ""
    var st_gender = ""
    var st_email = ""
    var st_mobileno = ""
    var st_photo = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        lblstid.text = st_id
        lblstname.text = st_name
        lblstgender.text = st_gender
        lblstemail.text = st_email
        lblstmobileno.text = st_mobileno
        
        let url = URL(string: st_photo)
        self.imageview.af.setImage(withURL: url!)
        
    }
    
   

   

}
