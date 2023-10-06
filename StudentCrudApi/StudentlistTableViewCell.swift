//
//  StudentlistTableViewCell.swift
//  StudentCrudApi
//
//  Created by Apple on 24/08/23.
//

import UIKit

class StudentlistTableViewCell: UITableViewCell {

    @IBOutlet weak var Stimageview: UIImageView!
    @IBOutlet weak var lblstudentid: UILabel!
    @IBOutlet weak var lblstudentname: UILabel!
    @IBOutlet weak var lblstudentgender: UILabel!
    @IBOutlet weak var lblstudentemail: UILabel!
    @IBOutlet weak var lblstudentmobileno: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
