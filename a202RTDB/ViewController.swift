//
//  ViewController.swift
//  a202RTDB
//
//  Created by 申潤五 on 2022/3/27.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var nickNameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().signInAnonymously(completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? Page2ViewController{
            nextVC.nickname = nickNameTF.text ?? ""
        }
    }

    @IBAction func goPage2(_ sender: Any) {
        let nickName = nickNameTF.text ?? ""
        if nickName.count < 1{
            let alert = UIAlertController(title: "請輸入匿稱", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
            return
        }
        //go Next page
        self.performSegue(withIdentifier: "goPage2", sender: nil)
        
    }
    
}

