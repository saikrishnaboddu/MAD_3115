//
//  ViewController.swift
//  Project_MAD3115
//
//  Created by saikrishna B on 23/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
   
    @IBAction func login(_ sender: Any) {
        if(userName.text=="admin"&&password.text=="admin"){
            performSegue(withIdentifier: "login", sender: self)
        }
        else{
            userName.text=""
            password.text=""
            let alert=UIAlertController(title: "Error", message: "Please enter valid Creds", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { _ in
                self.dismiss(animated: true, completion: nil)
            }))
                
            self.present(alert, animated: true, completion: nil)
        
        }
    }
}

