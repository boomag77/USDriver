//
//  TestViewController.swift
//  USDriver
//
//  Created by Sergey on 8/17/22.
//

import UIKit

class TestViewController: UIViewController {
    
    private let borderWidthForAnswerButtons: CGFloat! = 1
    private weak var colorForRightAnswer: CGColor! = UIColor.systemGreen.cgColor
    private weak var colorForWrongAnswer: CGColor! = UIColor.systemRed.cgColor
    private let cornerRadiusForAnswers: CGFloat! = 10
    private weak var colorForQuizAnswer: CGColor! = UIColor.systemBlue.cgColor
    
    var mode: Mode = Settings.instance.mode!
    var test: Test = Test(withMode: Settings.instance.mode!)
    
    private var currentCardAnswers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showCard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "\(test.mode.description)"
        nextButton.isHidden = true
    }
    
    //@IBOutlet weak var question: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var cardImage: UIImageView!
    
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        if test.mode == .study {
            if test.checkAnswer(answer: currentCardAnswers[sender.tag]) {
                markRightAnswerButton(sender)
                disableUnselectedAnswerButtons(sender.tag)
                nextButton.isHidden = false
            } else {
                markWrongAnswerButton(sender)
            }
        } else {
            let _ = test.checkAnswer(answer: currentCardAnswers[sender.tag])
            //markSelectedAnswerButton(sender)
            disableUnselectedAnswerButtons(sender.tag)
            showCard()  
        }
    }
    
    private func markSelectedAnswerButton(_ button: UIButton) {
        button.layer.borderWidth = borderWidthForAnswerButtons
        button.layer.cornerRadius = cornerRadiusForAnswers
        button.layer.borderColor = colorForQuizAnswer
    }
    
    private func markRightAnswerButton(_ button: UIButton) {
        button.layer.borderWidth = borderWidthForAnswerButtons
        button.layer.cornerRadius = cornerRadiusForAnswers
        button.layer.borderColor = colorForRightAnswer
    }
    
    private func markWrongAnswerButton(_ button: UIButton) {
        button.layer.borderWidth = borderWidthForAnswerButtons
        button.layer.cornerRadius = cornerRadiusForAnswers
        button.layer.borderColor = colorForWrongAnswer
    }
    
    private func disableUnselectedAnswerButtons(_ tag: Int) {
        switch tag {
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
    }

    @IBAction func nextCard(_ sender: UIButton) {
        showCard()
    }
    
    private func showCard() {
        enableAnswerButtons()
        guard let card = test.getCard() else {
            showResult()
            return
        }
        var imageForShow: UIImage? {
            if let image = card.question.image {
                return image
            } else {
                return nil
            }
        }
        cardImage.image = imageForShow
        currentCardAnswers = card.answer
        setAnswersToButtons(currentCardAnswers)
        if let cardText = card.question.text {
            print(cardText)
        }
    }
    
    private func enableAnswerButtons() {
        answerButton1.isEnabled = true
        answerButton2.isEnabled = true
        answerButton3.isEnabled = true
    }
    
    private func setAnswersToButtons(_ answers: [Answer]) {
        nextButton.isHidden = true
        answerButton1.setTitle(answers[0].text, for: .normal)
        answerButton1.setTitleColor(.label, for: .normal)
        answerButton1.layer.borderColor = UIColor.clear.cgColor
        answerButton2.setTitle(answers[1].text, for: .normal)
        answerButton2.setTitleColor(.label, for: .normal)
        answerButton2.layer.borderColor = UIColor.clear.cgColor
        answerButton3.setTitle(answers[2].text, for: .normal)
        answerButton3.setTitleColor(.label, for: .normal)
        answerButton3.layer.borderColor = UIColor.clear.cgColor
    }
    
    private func showResult() {
        let alert = UIAlertController(title: "You result", message: test.calculateResult(), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in self.navigationController?.popViewController(animated: true)}))
        self.present(alert, animated: true, completion: nil)
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
