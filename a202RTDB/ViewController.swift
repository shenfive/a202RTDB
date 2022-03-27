//
//  ViewController.swift
//  a202RTDB
//
//  Created by 申潤五 on 2022/3/27.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var ref:DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().signInAnonymously(completion: nil)
        ref = Database.database().reference()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        ref.child("test").child("string").setValue("這是一個測試")
//
//        var arr = [9999,333,444]
//
//        ref.child("test").child("array").setValue(arr)
        
        
        var dic = ["name":"Danny","age":25] as [String : Any]
        
        ref.child("test").child("dic").setValue(dic)
    }


}

