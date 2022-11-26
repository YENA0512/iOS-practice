//
//  NotesTableViewCell.swift
//  week4-1
//
//  Created by 이예나 on 10/12/22.
//

import UIKit
import SwipeCellKit

class NotesTableViewCell: SwipeTableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    var noteData: notesDataModel? {
        didSet{
           if let notesData = noteData {
               titleLabel.text = notesData.title
                timeLabel.text = notesData.time
                contentLabel.text = notesData.content

            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
