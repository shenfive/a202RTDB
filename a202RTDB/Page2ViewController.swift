//
//  Page2ViewController.swift
//  a202RTDB
//
//  Created by 申潤五 on 2022/3/27.
//

import UIKit
import Firebase

class Page2ViewController: UIViewController {
    
    var nickname = ""
    var ref:DatabaseReference!
    var subjects:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "歡迎：\(nickname)"
        ref = Database.database().reference().child("for/subs")
        ref.observeSingleEvent(of: .value) { dataSnap in
            print(dataSnap)
            self.subjects.removeAll()
            for item in dataSnap.children{
                if let theSubject = item as? DataSnapshot{
                    let suject = theSubject.childSnapshot(forPath: "subject").value as? String ?? ""
//                    print(suject)
                    self.subjects.append(suject)
                }
            }
            
            print(self.subjects)
            
        }
        
    }
    
    


}
