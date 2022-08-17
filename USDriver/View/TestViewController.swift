//
//  TestViewController.swift
//  USDriver
//
//  Created by Sergey on 8/17/22.
//

import UIKit

class TestViewController: UIViewController {
    
    var test = Test(option: .study)
    var rightButton: UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCard()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var question: UILabel!
    @IBOutlet var answerButton1: UIButton!
    @IBOutlet var answerButton2: UIButton!
    @IBOutlet var answerButton3: UIButton!
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        
    }
    
    @IBAction func nextCard(_ sender: UIButton) {
        setCard()
    }
    
    private func setCard() {
        let card = test.getCard()
        self.question.text = card?.question.text
        self.answerButton1.setTitle(card?.answers[0].text, for: .normal)
        self.answerButton2.setTitle(card?.answers[1].text, for: .normal)
        self.answerButton3.setTitle(card?.answers[2].text, for: .normal)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
