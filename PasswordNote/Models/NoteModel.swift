//
//  NoteModel.swift
//  PasswordNote
//
//  Created by 郑鸿川 on 2017/7/27.
//  Copyright © 2017年 郑鸿川. All rights reserved.
//

import RealmSwift

class Password: Object {
    dynamic var password = ""
}

class NoteModel: Object {
    dynamic var noteName = ""
    dynamic var userName = ""
    let passwordList = List<Password>()
    dynamic var mark = ""

    static func createNewNoteModel(model: NoteModel) {
        //使用默认的数据库
        let realm = try! Realm()
        
        // 通过事务将数据添加到 Realm 中
        try! realm.write {
            realm.add(model)
        }
    }
}
