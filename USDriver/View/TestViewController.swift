//
//  TestViewController.swift
//  USDriver
//
//  Created by Sergey on 8/17/22.
//

import UIKit


class TestViewController: UIViewController {
    
    let borderWidthForAnswerButtons: CGFloat = 1
    let colorForRightAnswer: CGColor = UIColor.systemGreen.cgColor
    let colorForWrongAnswer: CGColor = UIColor.systemRed.cgColor
    let cornerRadiusForAnswers: CGFloat = 10
    
    var test = Test(mode: .study)
    var currentCardAnswers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showCard()
        // Do any additional setup after loading the view.
    }
    
    //@IBOutlet weak var question: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var cardImage: UIImageView!
    
    @IBAction func checkAnswer(_ sender: AnyObject) {
        if currentCardAnswers[sender.tag].isRight == .yes {
            sender.layer.borderWidth = borderWidthForAnswerButtons
            sender.layer.cornerRadius = cornerRadiusForAnswers
            sender.layer.borderColor = colorForRightAnswer
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
            sender.layer.borderWidth = borderWidthForAnswerButtons
            sender.layer.cornerRadius = cornerRadiusForAnswers
            sender.layer.borderColor = colorForWrongAnswer
        }
    }
    
    @IBAction func nextCard(_ sender: UIButton) {
        showCard()
    }
    
    private func showCard() {
        nextButton.isEnabled = false
        enableAnswerButtons()
        guard let card = test.getCard() else { return }
        //question.text = card.question.text
        cardImage.image = card.question.image
        currentCardAnswers = card.answers
        answerButton1.setTitle(currentCardAnswers[0].text, for: .normal)
        answerButton1.setTitleColor(.black, for: .normal)
        answerButton1.layer.borderColor = UIColor.clear.cgColor
        answerButton2.setTitle(currentCardAnswers[1].text, for: .normal)
        answerButton2.setTitleColor(.black, for: .normal)
        answerButton2.layer.borderColor = UIColor.clear.cgColor
        answerButton3.setTitle(currentCardAnswers[2].text, for: .normal)
        answerButton3.setTitleColor(.black, for: .normal)
        answerButton3.layer.borderColor = UIColor.clear.cgColor
        
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
