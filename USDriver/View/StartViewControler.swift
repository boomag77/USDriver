//
//  StartViewController.swift
//  USDriver
//
//  Created by Sergey on 8/16/22.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBAction func startStudy(_ sender: UIButton) {
        Settings.instance.mode = .study
        showTestViewController()
    }
    @IBAction func startTest(_ sender: UIButton) {
        Settings.instance.mode = .quiz
        showTestViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showTestViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "TestViewController") as? TestViewController {
            navigationController?.pushViewController(vc, animated: true)
            dismiss(animated: true, completion: nil)
        }
    }
}

