//
//  StorageViewController.swift
//  QKC Wallet
//
//  Created by Jerry on 2018/8/1.
//  Copyright © 2018年 SoftChain Foundation Ltd. All rights reserved.
//

import UIKit
import CoreData

class StorageViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextViewDelegate {
    
    @IBOutlet weak var noteInfoView: UIView!
    @IBOutlet weak var noteImagView: UIView!
    
    @IBOutlet weak var noteNameLable: UITextField!
    @IBOutlet weak var noteDescriptionLabel: UITextView!
    
    @IBOutlet weak var noteImageView: UIImageView!
    
    var managedObjectContext: NSManagedObjectContext? {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    var notesFetchedResultsController: NSFetchedResultsController <Notes>!
    var notes = [Notes]()
    var note: Notes?
    var isExisting = false
    var indexPath: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Load Data
        if let note = note {
            noteNameLable.text = note.noteName
            noteDescriptionLabel.text = note.noteDecription
            noteImageView.image = UIImage(data: note.noteImage! as Data)
        }
        
        if noteNameLable.text != "" {
            isExisting = true
        }
        
        //Delegates
        noteNameLable.delegate = self
        noteDescriptionLabel.delegate = self
        
        //Styles
        noteInfoView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        noteInfoView.layer.shadowOffset = CGSize(width: 0.75, height: 0.75)
        noteInfoView.layer.shadowRadius = 1.5
        noteInfoView.layer.shadowOpacity = 0.2
        noteInfoView.layer.cornerRadius = 2
        
        noteImageView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        noteImageView.layer.shadowOffset = CGSize(width: 0.75, height: 0.75)
        noteImageView.layer.shadowOpacity = 0.2
        noteImageView.layer.shadowRadius = 1.5
        noteImageView.layer.cornerRadius = 2
        
        noteNameLabel.setBottomBorder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func saveToCoreData(completion: @escaping () ->Void){
        managedObjectContext!.perform {
            do {
                try self.managedObjectContext?.save()
                completion ()
                print("Note saved to core data.")
            }
            
            catch let error {
                print("Error:\(error.localizedDescription)")
            }
        }
    }

    @IBAction func prickImageWasPress(_ sender: Any) {
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        
        let alertController = UIAlertController(title: "Add an Image", message: "Choose From", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) {
            (action) in pickerController.sourceType = .camera
            self.present(pickerController, animated: true, completion: nil)
        }
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) {
            (action) in pickerController.sourceType = .photoLibrary
            self.present(pickerController, animated: true, completion: nil)
            
        }
        
        let savedPhotosAction = UIAlertAction(title: "Save Photos Album", style: .default) {
            (action) in pickerController.sourceType = .savedPhotosAlbum
            self.present(pickerController, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibraryAction)
        alertController.addAction(savedPhotosAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
}
