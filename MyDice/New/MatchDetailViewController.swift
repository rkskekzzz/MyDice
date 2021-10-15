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
    
    @IBOutlet var rollButton: UIButton!
    @IBOutlet var userResult: UILabel!
    @IBOutlet var userCount: UILabel!
    @IBOutlet var opponentCount: UILabel!
    @IBOutlet var opponentResult: UILabel!
    
    private var diceLogic = DiceLogic()
    private var gameState: State = .wait
    
    private var currentGameState: State {
        get { gameState }
        set {
            gameState = newValue
            switch gameState {
            case .rolled:
                userResult.text = currentUserResult!.description
                rollButton.setTitle("Again!", for: .normal)
            case .wait:
                currentUserResult = 0
                currentOpponentResult = 0
                currentUserDiceCount = user!.diceCount
                currentOpponentDiceCount = opponent!.diceCount
                rollButton.setTitle("Roll the Dice!", for: .normal)
            }
        }
    }
    
    private var user: User?
    private var opponent: Opponent?
    
    
    private var currentUserResult: Int? {
        willSet {
            userResult.text = newValue!.description
        }
    }
    
    private var currentUserDiceCount: Int {
        get {
            user!.diceCount
        }
        set {
            user!.diceCount = newValue
            userCount.text = newValue.description
        }
    }
    
    private var currentOpponentResult: Int? {
        willSet {
            opponentResult.text = newValue!.description
        }
    }
    
    private var currentOpponentDiceCount: Int {
        get {
            opponent!.diceCount
        }
        set {
            opponent!.diceCount = newValue
            opponentCount.text = newValue.description
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let opponent = opponent else {
            fatalError("opponent is nil")
        }
        guard let user = user else {
            fatalError("user is nil")
        }
        
        self.opponent = opponent
        self.user = user
        
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
                print("user win! \(self.user!.diceCount) + \(currentOpponentDiceCount)")
                self.user!.diceCount += currentOpponentDiceCount
                currentOpponentDiceCount = 1
            case .lose:
                print("user win! \(self.user!.diceCount) + \(currentOpponentDiceCount)")
                self.opponent!.diceCount += currentUserDiceCount
                currentUserDiceCount = 1
            }
            matchChangeAction?(opponent!, user!)
            currentGameState = .wait
            
        case .wait:
            diceLogic.setDiceCount(opponent!.diceCount)
            currentOpponentResult = diceLogic.sumOfDiceRolls()
            
            diceLogic.setDiceCount(user!.diceCount)
            currentUserResult = diceLogic.sumOfDiceRolls()
            
            print("user \(currentUserResult), oppo \(currentOpponentResult)")
            
            currentGameState = .rolled
        }

        
    }
}

extension MatchViewController {
    
}
