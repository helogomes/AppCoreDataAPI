//
//  TableViewCell.swift
//  TesteIntermediarioCoreData
//
//  Created by Heloisa on 06/06/22.
//

import UIKit
import SDWebImage

class TableViewCell: UITableViewCell {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

   func setup(value: Character) {
        self.lbName.text = value.name
        self.lbName.adjustsFontSizeToFitWidth = true
        self.lbDescription.text = value.description
        self.lbDescription.adjustsFontSizeToFitWidth = true
        let url = extractImage(data: value.thumbnail)
        self.myImage.sd_setImage(with: url)
    }
    
    func extractImage(data: [String:String]) -> URL? {
        let path = data["path"] ?? ""
        let ext = data["extension"] ?? ""
        return URL(string: "\(path).\(ext)")
    }
    

}
