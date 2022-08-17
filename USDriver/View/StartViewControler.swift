//
//  StartViewController.swift
//  USDriver
//
//  Created by Sergey on 8/16/22.
//

import UIKit

class StartViewController: UIViewController {

    var optionForTest: Option?
    
    @IBAction func startStudy(_ sender: UIButton) {
        optionForTest = .study
    }
    
    @IBAction func startTest(_ sender: UIButton) {
        optionForTest = .quiz
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

