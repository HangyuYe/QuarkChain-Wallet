//
//  noteTableTableViewController.swift
//  QKC Wallet
//
//  Created by Jerry on 2018/8/1.
//  Copyright © 2018年 SoftChain Foundation Ltd. All rights reserved.
//

import UIKit
import CoreData

class notesTableViewController: UITableViewController {
    
    var notes = [Notes]()
    
    var managedObjectContext: NSManagedObjectContext? {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Styles
        self.tableView.backgroundColor = UIColor(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0, alpha: 1.0)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        retrieveNotes()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return notes.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notesTableViewCell", for: indexPath) as! noteTableViewCell
        
        let note: Notes = notes[indexPath.row]
        cell.configureCell(notes: note)
        cell.backgroundColor = UIColor.clear

        return cell
    }
 

 
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        tableView.reloadData()
    }
    
    func retrieveNotes() {
        managedObjectContext?.perform {
            self.fetchNoteFromCoreData { (notes) in
                if let notes = notes{
                    self.notes = notes
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func fetchNoteFromCoreData(completion: @escaping([Notes]?) -> Void) {
        managedObjectContext?.perform {
            var notes = [Notes]()
            let request: NSFetchRequest<Notes> = Notes.fetchRequest()
            
            do {
                notes = try self.managedObjectContext!.fetch(request)
                completion(notes)
            }
            
            catch {
                print("Error:\(error.localizedDescription)")
            }
        
        }
    }
    
    
    
    
    
}
