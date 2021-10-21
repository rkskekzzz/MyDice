//
//  ViewController.swift
//  MyDice
//
//  Created by su on 2021/10/14.
//

import UIKit

enum GameState {
    case rolled
    case ongoing
    case reset
}

class MatchViewController: UIViewController {

    @IBOutlet var rollButton: UIButton!
    
    @IBOutlet var userResult: UILabel!
    @IBOutlet var userCount: UILabel!
    
    @IBOutlet var comCount: UILabel!
    @IBOutlet var comResult: UILabel!
    
    var receivedCom: ComData? = nil
    
    private var myGameState: GameState {
        get { gameState }
        set {
            gameState = newValue
            switch gameState {
            case .reset:
                userDiceCount = 1
                comDiceCount = 1
                userResult.text = "0"
                comResult.text = "0"
                gameState = .ongoing
            case .ongoing:
                userResult.text = "0"
                comResult.text = "0"
                rollButton.setTitle("Roll!", for: .normal)
            case .rolled:
                userResult.text = String(userCurrentResult)
                comResult.text = String(comCurrentResult)
                rollButton.setTitle("OK!", for: .normal)
           }
            
        }
    }
    
    private var gameState: GameState = .ongoing
    private var gameResult: DiceRule = .draw

    private var diceLogic = DiceLogic()
    
    private var user = UserData.data
//    private var com = ComData.data[0]
    private var com: ComData = ComData(diceCount: 99)
    
    private var userDiceCount: Int {
        get { user.diceCount }
        set {
            user.diceCount = newValue
            userCount.text = String(newValue)
        }
    }
    private var comDiceCount: Int {
        get { com.diceCount }
        set {
            com.diceCount = newValue
            comCount.text = String(newValue)
        }
    }
    
    private var userCurrentResult: Int {
        get { Int(userResult.text!) ?? 0 }
        set { userResult.text = String(newValue) }
    }
    
    private var comCurrentResult: Int {
        get { Int(comResult.text!) ?? 0 }
        set { comResult.text = String(newValue) }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let receivedCom = receivedCom else {
            fatalError("receivedCom data doesn't exist")
        }
        com = receivedCom
        comCount.text = String(com.diceCount)
    }

    @IBAction func rollButtonClicked(_ sender: Any) {
        print("before : \(UserData.data.diceCount)")
        print("after : \(UserData.data.diceCount)")
        
        switch gameState {
        case .ongoing:
            diceLogic.setDiceCount(userDiceCount)
            userCurrentResult = diceLogic.sumOfDiceRolls()
            
            diceLogic.setDiceCount(comDiceCount)
            comCurrentResult = diceLogic.sumOfDiceRolls()

            myGameState = .rolled
        case .reset, .rolled:
            // 안에 있는 switch case 문 밖으로 빼보기!
            gameResult = diceLogic.resultOfCompetition(user: userCurrentResult, com: comCurrentResult)
            
            switch gameResult {
            case .draw:
                break
            case .win:
                userDiceCount += comDiceCount
                comDiceCount = 1
            case .lose:
                comDiceCount += userDiceCount
                userDiceCount = 1
            }
            myGameState = .ongoing
        }
    }
    
    @IBAction func resetButtonClicked(_ sender: Any) {
        myGameState = .reset
    }
}

