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
    typealias MatchChangeAction = (Opponent, User) -> Void
    
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
                currentUserDiceCount = user!.diceCount
                currentOpponentDiceCount = opponent!.diceCount
                gamePlayButton.setTitle("Roll the Dice!", for: .normal)
            }
        }
    }
    
    private var user: User?
    private var opponent: Opponent?
    
    
    private var currentUserResult: Int? {
        willSet {
            userResultLabel.text = newValue!.description
        }
    }
    
    private var currentUserDiceCount: Int {
        get {
            user!.diceCount
        }
        set {
            user!.diceCount = newValue
            userCountLabel.text = newValue.description
        }
    }
    
    private var currentOpponentResult: Int? {
        willSet {
            opponentResultLabel.text = newValue!.description
        }
    }
    
    private var currentOpponentDiceCount: Int {
        get {
            opponent!.diceCount
        }
        set {
            opponent!.diceCount = newValue
            opponentCountLabel.text = newValue.description
        }
    }
    
    
    private var matchChangeAction: MatchChangeAction?


    func configure(with data: (Opponent: Opponent, user: User), changeAction: @escaping MatchChangeAction) {
        self.opponent = data.Opponent
        self.user = data.user
        self.matchChangeAction = changeAction
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let opponent = opponent else {
            fatalError("opponent is nil")
        }
        guard let user = user else {
            fatalError("user is nil")
        }
        
        self.opponent = opponent
        self.user = user
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userNameLabel.text = user!.name
        opponentNameLabel.text = opponent!.name
        currentGameState = .wait
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        switch currentGameState {
        case .rolled:
            let gameResult = diceLogic.resultOfCompetition(user: currentUserResult!, com: currentOpponentResult!)

            print("game result : \(gameResult)")
            switch gameResult {
            case .draw:
                break
            case .win:
                user!.diceCount += currentOpponentDiceCount
                currentOpponentDiceCount = 1
            case .lose:
                opponent!.diceCount += currentUserDiceCount
                currentUserDiceCount = 1
            }
            matchChangeAction?(opponent!, user!)
            
            currentGameState = .wait
        case .wait:
            diceLogic.setDiceCount(opponent!.diceCount)
            currentOpponentResult = diceLogic.sumOfDiceRolls()
            
            diceLogic.setDiceCount(user!.diceCount)
            currentUserResult = diceLogic.sumOfDiceRolls()
            
            currentGameState = .rolled
        }

        
    }
}

extension MatchViewController {
    
}
