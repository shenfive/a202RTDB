//
//  Page3ViewController.swift
//  a202RTDB
//
//  Created by 申潤五 on 2022/3/27.
//

import UIKit
import Firebase

class Page3ViewController: UIViewController {
    
    var key = ""
    var suject = ""
    var ref:DatabaseReference!

    @IBOutlet weak var theContentTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(suject)"
        ref = Database.database().reference().child("for/disc").child(key)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func newMessage(_ sender: Any) {
        let newMsg = theContentTF.text ?? ""
        if newMsg.count < 1 {
            let alert = UIAlertController(title: "至少輸入一個字", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
            return
        }
        ref.childByAutoId().child("content").setValue(newMsg)
        theContentTF.text = ""
        
        
        
    }
    


}
