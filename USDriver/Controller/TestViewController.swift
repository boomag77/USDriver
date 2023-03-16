//
//  TestViewController.swift
//  USDriver
//
//  Created by Sergey on 8/17/22.
//

import UIKit

class TestViewController: UIViewController {
    
    
    private let borderWidthForAnswerButtons: CGFloat! = 1
    private let colorForRightAnswer: CGColor! = UIColor.systemGreen.cgColor
    private let colorForWrongAnswer: CGColor! = UIColor.systemRed.cgColor
    private let cornerRadiusForAnswers: CGFloat! = 10
    private let colorForQuizAnswer: CGColor! = UIColor.systemBlue.cgColor
    
    var mode: Mode = Settings.instance.mode!
    var test: Test = Test(withMode: Settings.instance.mode!)
    
    private var currentCardAnswers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(test.mode.description)"
        tableView.dataSource = self
        tableView.delegate = self
        
        //tableView.cellLayoutMarginsFollowReadableWidth = true
        nextButton.titleLabel?.numberOfLines = 1
        showCard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //@IBOutlet weak var question: UILabel!

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!

    @IBAction func nextCard(_ sender: UIButton) {
        showCard()
    }
    
    private func showCard() {
        
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
        nextButton.isHidden = true
        tableView.reloadData()
    }
    
    private func showResult() {
        let alert = UIAlertController(title: "You result", message: test.calculateResult(), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in self.navigationController?.popViewController(animated: true)}))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension TestViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = currentCardAnswers[indexPath.row].text
        content.textProperties.numberOfLines = 2
        content.textProperties.adjustsFontForContentSizeCategory = true
        content.textProperties.adjustsFontSizeToFitWidth = true
        cell.contentConfiguration = content
        cell.layer.borderWidth = 0
        cell.layer.cornerRadius = cornerRadiusForAnswers
        return cell
    }
    
}

extension TestViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if test.mode == .study {
            
            if test.checkAnswer(answer: currentCardAnswers[indexPath.row]) {
                tableView.cellForRow(at: indexPath)?.layer.borderWidth = borderWidthForAnswerButtons
                tableView.cellForRow(at: indexPath)?.layer.borderColor = colorForRightAnswer
                nextButton.isHidden = false
                
            } else {
                tableView.cellForRow(at: indexPath)?.layer.borderWidth = borderWidthForAnswerButtons
                tableView.cellForRow(at: indexPath)?.layer.borderColor = colorForWrongAnswer
                
            }
        } else {
            let _ = test.checkAnswer(answer: currentCardAnswers[indexPath.row])
            showCard()
        }
        
    }
}
