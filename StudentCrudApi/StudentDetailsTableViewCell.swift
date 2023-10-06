//
//  StudentDetailsTableViewCell.swift
//  StudentCrudApi
//
//  Created by Apple on 24/08/23.
//

import UIKit

class StudentDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblstid: UILabel!
    @IBOutlet weak var lblstname: UILabel!
    @IBOutlet weak var lblstgender: UILabel!
    @IBOutlet weak var lblstemail: UILabel!
    @IBOutlet weak var lblstmobileno: UILabel!
    @IBOutlet weak var stdetailsimageview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
