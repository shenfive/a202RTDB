//
//  Page3ViewController.swift
//  a202RTDB
//
//  Created by 申潤五 on 2022/3/27.
//

import UIKit
import Firebase

class Page3ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var pag3TableView: UITableView!
    var key = ""
    var suject = ""
    var nickname = ""
    var ref:DatabaseReference!
    var contents:[String] = []

    @IBOutlet weak var theContentTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        pag3TableView.delegate = self
        pag3TableView.dataSource = self
        
        
        self.title = "\(suject)"
        ref = Database.database().reference().child("for/disc").child(key)

        // Do any additional setup after loading the view.
        
        ref.observe(.value) { dataSnapshot in
            self.contents.removeAll()
            for item in dataSnapshot.children{
                
                if let content = item as? DataSnapshot{
                    print("=======")
               
                    let theContent = content.childSnapshot(forPath: "content").value as? String ?? ""
                    print(theContent)
                    self.contents.append(theContent)
                    
                }
                print(self.contents.count)
                self.pag3TableView.reloadData()
            }
        }
        
        
        
        
        
    }
    
    @IBAction func newMessage(_ sender: Any) {
        let newMsg = theContentTF.text ?? ""
        if newMsg.count < 1 {
            let alert = UIAlertController(title: "至少輸入一個字", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
            return
        }
        ref.childByAutoId().child("content").setValue(nickname + ":" + newMsg)
        theContentTF.text = ""
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = contents[indexPath.row]
        return cell
    }
    


}
