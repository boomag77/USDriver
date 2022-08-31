//
//  Cards`.swift
//  USDriver
//
//  Created by Sergey on 8/16/22.
//

import Foundation
import UIKit

protocol CardsStorageProtocol {
    var numberOfCards: Int { get }
    var numberOfAnswersInCard: Int { get }
    var cards: [Card] { get set }
}

class CardsStorage: CardsStorageProtocol {
    
    let numberOfAnswersInCard: Int
    var numberOfCards: Int
    
    var cards: [Card] = [
        Card(cardId: 0,
             question: Question(text: nil, image: UIImage(named: "0")),
             answer: [Answer(text: "Stop completely and check for pedestrians and cross traffic", isRight: .yes)]),
        Card(cardId: 1,
             question: Question(text: nil, image: UIImage(named: "1")),
             answer: [Answer(text: "Slow down and yield the right-of-way to other traffic", isRight: .yes)]),
        Card(cardId: 14,
             question: Question(text: nil, image: UIImage(named: "14")),
             answer: [Answer(text: "You must not pass another vehicle", isRight: .yes)]),
        Card(cardId: 10,
             question: Question(text: nil, image: UIImage(named: "10")),
             answer: [Answer(text: "The left line is reserved for vehicles with a specific number of occupants", isRight: .yes)]),
        Card(cardId: 16,
             question: Question(text: nil, image: UIImage(named: "16")),
             answer: [Answer(text: "You may make left turns", isRight: .yes)]),
        Card(cardId: 21,
             question: Question(text: nil, image: UIImage(named: "21")),
             answer: [Answer(text: "No right turn (Right turns are not permitted)", isRight: .yes)]),
        Card(cardId: 22,
             question: Question(text: nil, image: UIImage(named: "22")),
             answer: [Answer(text: "No left turn", isRight: .yes)]),
        Card(cardId: 23,
             question: Question(text: nil, image: UIImage(named: "23")),
             answer: [Answer(text: "No U-turn", isRight: .yes)]),
        Card(cardId: 24,
             question: Question(text: nil, image: UIImage(named: "24")),
             answer: [Answer(text: "The maximum safe driving speed under ideal road and weather conditions", isRight: .yes)]),
        Card(cardId: 25,
             question: Question(text: nil, image: UIImage(named: "25")),
             answer: [Answer(text: "Oncoming traffic has extended green on traffic light", isRight: .yes)]),
        Card(cardId: 26,
             question: Question(text: nil, image: UIImage(named: "26")),
             answer: [Answer(text: "Oncoming traffic may have extended green on traffic light", isRight: .yes)]),
        Card(cardId: 27,
             question: Question(text: nil, image: UIImage(named: "27")),
             answer: [Answer(text: "Slippery when wet", isRight: .yes)]),
        Card(cardId: 28,
             question: Question(text: nil, image: UIImage(named: "28")),
             answer: [Answer(text: "School crossing ahead", isRight: .yes)]),
        Card(cardId: 29,
             question: Question(text: nil, image: UIImage(named: "29")),
             answer: [Answer(text: "Traffic light ahead", isRight: .yes)]),
        Card(cardId: 30,
             question: Question(text: nil, image: UIImage(named: "30")),
             answer: [Answer(text: "Upcoming hill", isRight: .yes)]),
        Card(cardId: 31,
             question: Question(text: nil, image: UIImage(named: "31")),
             answer: [Answer(text: "Keep to the side indicated by the arrow (right)", isRight: .yes)]),
        Card(cardId: 32,
             question: Question(text: nil, image: UIImage(named: "32")),
             answer: [Answer(text: "Keep to the side indicated by the arrow (left)", isRight: .yes)]),
        Card(cardId: 33,
             question: Question(text: nil, image: UIImage(named: "33")),
             answer: [Answer(text: "One way traffic", isRight: .yes)]),
        Card(cardId: 34,
             question: Question(text: nil, image: UIImage(named: "34")),
             answer: [Answer(text: "Bicycle crossing", isRight: .yes)]),
        Card(cardId: 35,
             question: Question(text: nil, image: UIImage(named: "35")),
             answer: [Answer(text: "Winding road", isRight: .yes)]),
        Card(cardId: 36,
             question: Question(text: nil, image: UIImage(named: "36")),
             answer: [Answer(text: "Lane reduction; the right lane ends soon", isRight: .yes)]),
        Card(cardId: 37,
             question: Question(text: nil, image: UIImage(named: "37")),
             answer: [Answer(text: "Sharp right turn in the road ahead", isRight: .yes)]),
        Card(cardId: 38,
             question: Question(text: nil, image: UIImage(named: "38")),
             answer: [Answer(text: "A divided high way begins ahead. You must keep to the right", isRight: .yes)]),
        Card(cardId: 39,
             question: Question(text: nil, image: UIImage(named: "39")),
             answer: [Answer(text: "The road that you are on intersects with a divided highway", isRight: .yes)]),
        Card(cardId: 40,
             question: Question(text: nil, image: UIImage(named: "40")),
             answer: [Answer(text: "The maximum safe speed for an expressway exit", isRight: .yes)]),
        Card(cardId: 41,
             question: Question(text: nil, image: UIImage(named: "41")),
             answer: [Answer(text: "A road joins from the left", isRight: .yes)]),
        Card(cardId: 42,
             question: Question(text: nil, image: UIImage(named: "42")),
             answer: [Answer(text: "Do not enter", isRight: .yes)]),
        Card(cardId: 43,
             question: Question(text: nil, image: UIImage(named: "43")),
             answer: [Answer(text: "No parking (parking is not permitted)", isRight: .yes)]),
        Card(cardId: 44,
             question: Question(text: nil, image: UIImage(named: "44")),
             answer: [Answer(text: "The bridge ahead may be too narrow to meet or pass a truck", isRight: .yes)]),
        Card(cardId: 45,
             question: Question(text: nil, image: UIImage(named: "45")),
             answer: [Answer(text: "Traffic turning left on the green light must yield to oncoming traffic", isRight: .yes)]),
        Card(cardId: 46,
             question: Question(text: nil, image: UIImage(named: "46")),
             answer: [Answer(text: "Flagger ahead", isRight: .yes)]),
        Card(cardId: 47,
             question: Question(text: nil, image: UIImage(named: "47")),
             answer: [Answer(text: "The road is curving sharply to the left", isRight: .yes)]),
        Card(cardId: 48,
             question: Question(text: nil, image: UIImage(named: "48")),
             answer: [Answer(text: "Three-way ('T') intersection", isRight: .yes)]),
        Card(cardId: 49,
             question: Question(text: nil, image: UIImage(named: "49")),
             answer: [Answer(text: "Pedestrian crossing", isRight: .yes)]),
        Card(cardId: 51,
             question: Question(text: nil, image: UIImage(named: "51")),
             answer: [Answer(text: "An upcoming curve in the road", isRight: .yes)]),
        Card(cardId: 52,
             question: Question(text: nil, image: UIImage(named: "52")),
             answer: [Answer(text: "Crossroad ahead. Watch for traffic", isRight: .yes)]),
        Card(cardId: 53,
             question: Question(text: nil, image: UIImage(named: "53")),
             answer: [Answer(text: "The overpass ahead has a low clearance", isRight: .yes)]),
        Card(cardId: 54,
             question: Question(text: nil, image: UIImage(named: "54")),
             answer: [Answer(text: "You must bear either right or left", isRight: .yes)]),
        Card(cardId: 55,
             question: Question(text: nil, image: UIImage(named: "55")),
             answer: [Answer(text: "Parking spaces are reserved for people with disabled parking permits", isRight: .yes)]),
        Card(cardId: 56,
             question: Question(text: nil, image: UIImage(named: "56")),
             answer: [Answer(text: "Two-way traffic ahead", isRight: .yes)]),
        Card(cardId: 57,
             question: Question(text: nil, image: UIImage(named: "57")),
             answer: [Answer(text: "Deer crossing", isRight: .yes)]),
        Card(cardId: 58,
             question: Question(text: nil, image: UIImage(named: "58")),
             answer: [Answer(text: "Divided highway ends ahead", isRight: .yes)]),
        Card(cardId: 59,
             question: Question(text: nil, image: UIImage(named: "59")),
             answer: [Answer(text: "Workers are on or very close to the road in the work zone ahead", isRight: .yes)]),
        Card(cardId: 60,
             question: Question(text: nil, image: UIImage(named: "60")),
             answer: [Answer(text: "No passing zone", isRight: .yes)]),
        Card(cardId: 61,
             question: Question(text: nil, image: UIImage(named: "61")),
             answer: [Answer(text: "The highway ahead is undergoing maintenance", isRight: .yes)]),
        Card(cardId: 62,
             question: Question(text: nil, image: UIImage(named: "62")),
             answer: [Answer(text: "A recommended speed for a curve or turn", isRight: .yes)]),
        Card(cardId: 63,
             question: Question(text: nil, image: UIImage(named: "63")),
             answer: [Answer(text: "Slow down because the road ahead changes direction at an extreme angle", isRight: .yes)]),
        Card(cardId: 64,
             question: Question(text: nil, image: UIImage(named: "64")),
             answer: [Answer(text: "Hospital ahead", isRight: .yes)]),
        Card(cardId: 65,
             question: Question(text: nil, image: UIImage(named: "65")),
             answer: [Answer(text: "Merging traffic from the right", isRight: .yes)]),
        Card(cardId: 66,
             question: Question(text: nil, image: UIImage(named: "66")),
             answer: [Answer(text: "Parking fee station", isRight: .yes)]),
        Card(cardId: 67,
             question: Question(text: nil, image: UIImage(named: "67")),
             answer: [Answer(text: "Speed limit ahead", isRight: .yes)])
    ]
    
    var newCards: [Card] = []
    
    init(numberOfAnswersInCard: Int) {
        self.numberOfAnswersInCard = numberOfAnswersInCard
        self.numberOfCards = cards.count
    }
    
    private func addWrongAnswers() {
        guard cards.count > 1 else {
            return
        }
        
        func getWrongAnswersForCard(_ card: Card) -> [Answer] {
            var answersForCard: [Answer] = card.answer
            
            while answersForCard.count < numberOfAnswersInCard {
                if let randomCard = cards.randomElement() {
                    if randomCard.cardId != card.cardId {
                        var wrongAnswer = randomCard.answer[0]
                        if !answersForCard.contains(wrongAnswer) {
                            wrongAnswer.isRight = .no
                            answersForCard.append(wrongAnswer)
                        }
                    }
                }
            }
            return answersForCard.shuffled()
        }
        
        for card in cards {
            var newCard = card
            newCard.answer = getWrongAnswersForCard(card)
            newCards.append(newCard)
        }
    }
    
    func loadCards() -> [Card] {
        addWrongAnswers()
        return newCards
    }
}
