//
//  PeopleTableViewCell.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 11/07/2021.
//

import UIKit
class ContentListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cardView: DesignView!

    
    static let Identifier =  String(describing: ContentListTableViewCell.self)
    
    func config ( _ content: ItemsViewModel)
    {
        //let isoDate = "2016-04-14T10:44:00+0000"

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy/MM/dd'T'HH:mm:ssZ"
        print(content.date)
        //let date = dateFormatter.date(from:content.date)!
        //print(date)
        //let string = content.date
        //let date = RFC3339DateFormatter.date(from: string)
//         
        titleLabel.text =  content.title
        subTitleLabel.text =  content.subtitle
        dateLabel.text = content.date
    }
    

    
  
    
}
