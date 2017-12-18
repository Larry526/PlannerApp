//
//  LoginViewController.swift
//  PlannerApp
//
//  Created by Larry Luk on 2017-12-17.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userTxtField: UITextField!
    @IBOutlet weak var pwTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if userTxtField.text == "" || pwTxtField.text == "" {
            displayAlert(title: "Missing information.", message: "Please provide both email and password.")
        } else {
            Auth.auth().signIn(withEmail: userTxtField.text!, password: pwTxtField.text!) { (user, error) in
                if error != nil {
                    self.displayAlert(title: "Error", message: error!.localizedDescription)
                } else {
                    print("Login Success!")
                    self.performSegue(withIdentifier: "toMain", sender: self)
                }
            }
        }
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        
        if userTxtField.text == "" || pwTxtField.text == "" {
            displayAlert(title: "Missing information.", message: "Please provide both email and password.")
        } else {
            
            Auth.auth().createUser(withEmail: userTxtField.text!, password: pwTxtField.text!) { (user, error) in
                if error != nil {
                    self.displayAlert(title: "Error", message: error!.localizedDescription)
                } else {
                    print("Register Success!")
                    self.performSegue(withIdentifier: "toMain", sender: self)
                }
            }
        }
    }
    
    func displayAlert (title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}
