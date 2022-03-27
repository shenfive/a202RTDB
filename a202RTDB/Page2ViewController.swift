//
//  Page2ViewController.swift
//  a202RTDB
//
//  Created by 申潤五 on 2022/3/27.
//

import UIKit
import Firebase

class Page2ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var selectedID = 0
    var nickname = ""
    var ref:DatabaseReference!
    var subjects:[String] = []
    var keys:[String] = []
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
            self.keys.removeAll()
            for item in dataSnap.children{
                if let theSubject = item as? DataSnapshot{
                    let suject = theSubject.childSnapshot(forPath: "subject").value as? String ?? ""
//                    print(suject)
                    self.subjects.append(suject)
                    let key = theSubject.key
                    self.keys.append(key)
                }
            }
            
            print(self.subjects)
            self.theTableView.reloadData()
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? Page3ViewController{
            nextVC.key = keys[selectedID]
            nextVC.suject = subjects[selectedID]
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedID = indexPath.row
        
        
        performSegue(withIdentifier: "goPage3", sender: nil)
    }
    


}
