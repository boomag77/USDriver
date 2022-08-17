//
//  StartViewController.swift
//  USDriver
//
//  Created by Sergey on 8/16/22.
//

import UIKit

class StartViewController: UIViewController {

    @IBAction func startStudy(_ sender: UIButton) {
        let test = Test(option: .study)
        print(test.option)
    }
    
    @IBAction func startTest(_ sender: UIButton) {
        let test = Test(option: .quiz)
        print(test.option)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

