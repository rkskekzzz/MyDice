//
//  MatchViewController.swift
//  MyDice
//
//  Created by su on 2021/10/16.
//

import UIKit

enum State {
    case rolled
    case wait
}

class MatchDetailViewController: UIViewController {
    typealias MatchChangeAction = (Player, Player) -> Void
    
    @IBOutlet var opponentNameLabel: UILabel!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var userResultLabel: UILabel!
    @IBOutlet var userCountLabel: UILabel!
    @IBOutlet var opponentCountLabel: UILabel!
    @IBOutlet var opponentResultLabel: UILabel!

    @IBOutlet var gamePlayButton: UIButton!
    
    private var diceLogic = DiceLogic()
    private var gameState: State = .wait
    
    private var currentGameState: State {
        get { gameState }
        set {
            gameState = newValue
            switch gameState {
            case .rolled:
                gamePlayButton.setTitle("Again!", for: .normal)
            case .wait:
                currentUserResult = 0
                currentOpponentResult = 0
                userCountLabel.text = user.getDiceCount().description
                opponentCountLabel.text = opponent.getDiceCount().description
                gamePlayButton.setTitle("Roll the Dice!", for: .normal)
            }
        }
    }
    
    private var user: Player!
    private var opponent: Player!
    
    private var matchChangeAction: MatchChangeAction!
    
    private var currentUserResult: Int = 0 {
        willSet { userResultLabel.text = newValue.description }
    }
    
    private var currentOpponentResult: Int = 0 {
        willSet { opponentResultLabel.text = newValue.description }
    }
    

    func configure(with data: (opponent: Player, user: Player), changeAction: @escaping MatchChangeAction) {
        self.opponent = data.opponent
        self.user = data.user
        self.matchChangeAction = changeAction
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let _ = opponent else {
            fatalError("Opponent is nil")
        }
        guard let _ = user else {
            fatalError("User is nil")
        }
        guard let _ = matchChangeAction else {
            fatalError("Action is nil")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userNameLabel.text = user.getName()
        opponentNameLabel.text = opponent.getName()
        currentGameState = .wait
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        switch currentGameState {
        case .rolled:
            let gameResult = diceLogic.resultOfCompetition(user: currentUserResult, com: currentOpponentResult)

            print("game result : \(gameResult)")
            switch gameResult {
            case .draw:
                break
            case .win:
                user.takeDice(from: opponent)
                opponent.resetDiceCount()
            case .lose:
                opponent.takeDice(from: user)
                user.resetDiceCount()
            }
            matchChangeAction(opponent, user)
            currentGameState = .wait
        case .wait:
            currentOpponentResult = opponent.sumOfRollDice()
            currentUserResult = user.sumOfRollDice()
    
            currentGameState = .rolled
        }
    }
}
