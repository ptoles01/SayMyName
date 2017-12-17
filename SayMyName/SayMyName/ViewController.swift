//
//  ViewController.swift
//  SayMyName
//
//  Created by user131309 on 12/16/17.
//  Copyright © 2017 Patricia Toles. All rights reserved.
//

import UIKit
import ContactsUI


class ViewController: UIViewController, CNContactPickerDelegate {

    @IBOutlet weak var firstnameField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    @IBAction func getContact(_ sender: AnyObject) {
        let cn = CNContactStore()
        cn.requestAccess(for: CNEntityType.contacts) {
            (success: Bool, error: Error?) -> Void in
            DispatchQueue.main.async() {
                if (success == true) {
                    self.showPeoplePicker()
                }
            }
        }
    }
    @IBAction func sayContact(_ sender: AnyObject) {
        var personName : String = NSLocalizedString("SELECTED", comment: "Selected Person")
        if let forename = firstnameField.text {
            personName += forename
        }
        
        personName += " "
        
        if let lastname = lastnameField.text {
           personName += lastname
        }
        
        TextToSpeech.SayText(input: personName)
    }
    
    func showPeoplePicker() {
        
        let picker : CNContactPickerViewController = CNContactPickerViewController()
        picker.delegate = self
        
        self.present(picker, animated: true, completion: nil)
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        firstnameField.text? = contact.givenName
        lastnameField.text? = contact.familyName
    }
    
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        print("Cancelled")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

