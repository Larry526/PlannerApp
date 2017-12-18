//
//  ViewController.swift
//  PlannerApp
//
//  Created by Larry Luk on 2017-12-17.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()

    }

}

