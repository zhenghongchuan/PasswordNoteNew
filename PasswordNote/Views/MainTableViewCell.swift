//
//  MainTableViewCell.swift
//  PasswordNote
//
//  Created by 郑鸿川 on 2017/7/20.
//  Copyright © 2017年 郑鸿川. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var noteNameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var passWordLabel: UILabel!
    
    var noteData: NoteModel? {
        didSet {
            noteNameLabel.text = self.noteData?.noteName
            userNameLabel.text = self.noteData?.userName
            passWordLabel.text = self.noteData?.passwordList.first?.password
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
