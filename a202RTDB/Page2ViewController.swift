//
//  Page2ViewController.swift
//  a202RTDB
//
//  Created by 申潤五 on 2022/3/27.
//

import UIKit
import Firebase

class Page2ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    var nickname = ""
    var ref:DatabaseReference!
    var subjects:[String] = []
    @IBOutlet weak var theTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "歡迎：\(nickname)"
        
        theTableView.delegate = self
        theTableView.dataSource = self
        
        
        ref = Database.database().reference().child("for/subs")
        ref.observeSingleEvent(of: .value) { dataSnap in
//            print(dataSnap)
            self.subjects.removeAll()
            for item in dataSnap.children{
                if let theSubject = item as? DataSnapshot{
                    let suject = theSubject.childSnapshot(forPath: "subject").value as? String ?? ""
//                    print(suject)
                    self.subjects.append(suject)
                }
            }
            
            print(self.subjects)
            self.theTableView.reloadData()
            
        }
        
    }
    
    //MARK: TableView DataSource & Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = subjects[indexPath.row]
        
        return cell
    }
    


}
