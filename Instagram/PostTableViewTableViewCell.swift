//
//  PostTableViewTableViewCell.swift
//  Instagram
//
//  Created by IzumiYoshiki on 2019/02/10.
//  Copyright © 2019 Yoshiki Izumi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class PostTableViewTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    @IBOutlet weak var commentButton: UIButton!
    
    @IBOutlet weak var commentTextField: UITextField!
//    @IBAction func commentButton(_ sender: Any) {
//
//        self.captionLabel.text = commentTextField.text;
//
//        // 辞書を作成してFirebaseに保存する
//        let postRef = Database.database().reference().child(Const.PostPath)
//        let postDic = ["caption": textField.text!, "image": imageString, "time": String(time), "name": name!]
//        postRef.childByAutoId().setValue(postDic)
//
//
//
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setPostData(_ postData: PostData) {
        commentTextField.text = ""
        self.postImageView.image = postData.image
        
        var commentList: String = ""
        var names: [String] = []
        postData.commentsName.forEach { commentName in
            names.append(commentName)
        }
        var comments: [String] = []
        postData.comments.forEach { comment in
            comments.append(comment)
        }

        for i in 0..<names.count {
            commentList += names[i] + "：" + comments[i] + "\n"
        }

        self.captionLabel.text = "\(postData.name!) : \(postData.caption!) \n \(commentList)"
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = formatter.string(from: postData.date!)
        self.dateLabel.text = dateString
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
    }
}
