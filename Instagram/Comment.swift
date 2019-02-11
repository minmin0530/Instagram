//
//  Comment.swift
//  Instagram
//
//  Created by IzumiYoshiki on 2019/02/11.
//  Copyright © 2019 Yoshiki Izumi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class Comment: NSObject {
    var comment: String?
    var name: String?
    
    init(comment: String, name: String) {
        self.comment = comment
        self.name = name
    }
}
