//
//  MainViewController.swift
//  PasswordNote
//
//  Created by 郑鸿川 on 2017/7/22.
//  Copyright © 2017年 郑鸿川. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: RootViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var createButton: UIButton!
    
    var tableViewArray : Results<NoteModel>!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavBar()
        self.getAllNotes()
        NotificationCenter.default.addObserver(self, selector: #selector(self.notesHasChange), name: NSNotification.Name(rawValue: "kNotesHasChange"), object: nil)
        // Do any additional setup after loading the view.
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        if #available(iOS 11.0, *) {
//            self.navigationController?.navigationBar.prefersLargeTitles = true
//        } else {
//            // Fallback on earlier versions
//        }
//    }
    
    override func viewDidLayoutSubviews() {
        self.createButton.layer.shadowColor = UIColor.gray.cgColor
        self.createButton.layer.shadowOffset = CGSize.init(width: 3, height: 3)
        self.createButton.layer.shadowOpacity = 0.3
        self.createButton.layer.shadowRadius = 3
    }
    
    override func setupNavBar() {
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationItem.largeTitleDisplayMode = .always
            let searchController = UISearchController(searchResultsController: nil)
            navigationItem.searchController = searchController
        } else {
            // Fallback on earlier versions
            self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .search, target: self, action: nil)
        }
    }
    
    //MARK: Actions
    
    func notesHasChange() {
        self.getAllNotes()
        tableView.reloadData()
    }
    
    func getAllNotes() {
        let realm = try! Realm()
        tableViewArray = realm.objects(NoteModel.self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if tableViewArray == nil {
            return 0
        }
        return (tableViewArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kMainCell", for: indexPath) as! MainTableViewCell
        
        // Configure the cell...
        cell.selectionStyle = .none
        
        let object = tableViewArray[indexPath.row]
        cell.noteData = object
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "kNoteDetail", sender: tableViewArray[indexPath.row])
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        switch segue.identifier {
        case "kCreateNote"?:
            break
        case "kNoteDetail"?:
            (segue.destination as! NoteDetailViewController).data = sender as? NoteModel
            if #available(iOS 11.0, *) {
                self.navigationController?.navigationBar.prefersLargeTitles = false
            } else {
                // Fallback on earlier versions
            }
            break
        default:
            break
        }
     }
    
    
}
