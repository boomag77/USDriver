//
//  TestViewController.swift
//  USDriver
//
//  Created by Sergey on 8/17/22.
//

import UIKit


class TestViewController: UIViewController {
    enum AnswerButton {
        case button1
        case button2
        case button3
    }
    
    var test = Test(option: .study)
    var rightButton: UIButton?
    var currentCardAnswers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showCard()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    @IBAction func checkAnswer(_ sender: AnyObject) {
        if currentCardAnswers[sender.tag].isRight == .yes {
            sender.layer.borderWidth = 3
            sender.layer.cornerRadius = 10
            sender.layer.borderColor = UIColor.systemGreen.cgColor
            switch sender.tag {
            case 0:
                answerButton2.isEnabled = false
                answerButton3.isEnabled = false
            case 1:
                answerButton1.isEnabled = false
                answerButton3.isEnabled = false
            default:
                answerButton1.isEnabled = false
                answerButton2.isEnabled = false
            }
            nextButton.isEnabled = true
        } else {
            sender.layer.borderWidth = 3
            sender.layer.cornerRadius = 10
            sender.layer.borderColor = UIColor.systemRed.cgColor
        }
    }
    
    @IBAction func nextCard(_ sender: UIButton) {
        showCard()
    }
    
    private func showCard() {
        nextButton.isEnabled = false
        enableAnswerButtons()
        guard let card = test.getCard() else { return }
        self.question.text = card.question.text
        currentCardAnswers = card.answers
        self.answerButton1.setTitle(card.answers[0].text, for: .normal)
        self.answerButton1.setTitleColor(.black, for: .normal)
        self.answerButton1.layer.borderColor = UIColor.clear.cgColor
        self.answerButton2.setTitle(card.answers[1].text, for: .normal)
        self.answerButton2.setTitleColor(.black, for: .normal)
        self.answerButton2.layer.borderColor = UIColor.clear.cgColor
        self.answerButton3.setTitle(card.answers[2].text, for: .normal)
        self.answerButton3.setTitleColor(.black, for: .normal)
        self.answerButton3.layer.borderColor = UIColor.clear.cgColor
        
    }
    
    private func enableAnswerButtons() {
        answerButton1.isEnabled = true
        answerButton2.isEnabled = true
        answerButton3.isEnabled = true
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

