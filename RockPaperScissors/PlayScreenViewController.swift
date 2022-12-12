import UIKit

class PlayScreenViewController: UIViewController {
    
    var TrackRound = 0
    var WinRec = 0
    var LossRec = 0
    var x = ""
    
    
    
    
var imputName = ""
var imputRounds = 0
var enemy = 0
    
    var enemyVal = [1 : "rock",2: "paper",3 : "scissors"]
    @IBOutlet weak var roundTextOutlet: UILabel!
    @IBOutlet weak var gameHeroNameOutlet: UILabel!
    
    @IBOutlet weak var attackLabelOutlet: UILabel!
    @IBOutlet weak var recordTextOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        gameHeroNameOutlet.text = imputName
        recordTextOutlet.text = record().getRecord(win: WinRec, loss: LossRec)
        roundTextOutlet.text = "Round: \(TrackRound)"
        // Do any additional setup after loading the view.
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @IBAction func rockAction(_ sender: UITapGestureRecognizer) {
        enemy = Int.random(in: 1...3)
        attackLabelOutlet.text = enemyVal[enemy]
        if enemy == 2{
         LossRec =  record().loss(losser: LossRec)
        }
        else if enemy == 3{
           WinRec = record().win(winReco: WinRec)
        }
        else{
           TrackRound = record().tie(tracker: TrackRound)
        }
       TrackRound = record().roundEnd(round: TrackRound)
        print(TrackRound)
        print(imputRounds)
        if record().checkRound(tRound: imputRounds, tempRound: TrackRound) == true {
            if WinRec > LossRec{
                 x = "toWinScreen"
                performSegue(withIdentifier: "toWinScreen", sender: nil)
            }else if LossRec > WinRec{
                x = "toLoseScreen"
                performSegue(withIdentifier: "toLoseScreen", sender: nil)
            }
        }
        else{
            recordTextOutlet.text = record().getRecord(win: WinRec, loss: LossRec)
            roundTextOutlet.text = "Round: \(TrackRound)"
        }
    }
    
    @IBAction func paperAction(_ sender: UITapGestureRecognizer) {
        enemy = Int.random(in: 1...3)
        attackLabelOutlet.text = enemyVal[enemy]
        if enemy == 3{
          LossRec = record().loss(losser: LossRec)
        }
        else if enemy == 1{
         WinRec =  record().win(winReco: WinRec)
        }
        else{
          TrackRound = record().tie(tracker: TrackRound)
        }
        TrackRound = record().roundEnd(round: TrackRound)
        if record().checkRound(tRound: imputRounds, tempRound: TrackRound) == true {
            if WinRec > LossRec{
                x = "toWinScreen"
                performSegue(withIdentifier: "toWinScreen", sender: nil)
            }else if LossRec > WinRec{
                x = "toLoseScreen"
                performSegue(withIdentifier: "toLoseScreen", sender: nil)
            }
        }
        else{
            recordTextOutlet.text = record().getRecord(win: WinRec, loss: LossRec)
            roundTextOutlet.text = "Round: \(TrackRound)"
        }
    }
    @IBAction func scissorsAction(_ sender: Any) {
       
        enemy = Int.random(in: 1...3)
        print(enemy)
        attackLabelOutlet.text = enemyVal[enemy]
        if enemy == 1{
           LossRec = record().loss(losser: LossRec)
        }
        else if enemy == 2{
           WinRec = record().win(winReco: WinRec)
        }
        else{
           TrackRound = record().tie(tracker: TrackRound)
        }
        TrackRound = record().roundEnd(round: TrackRound)
        if record().checkRound(tRound: imputRounds, tempRound: TrackRound) == true {
            if WinRec > LossRec{
                x = "toWinScreen"
                performSegue(withIdentifier: "toWinScreen", sender: nil)
            }else if LossRec > WinRec{
                x = "toLoseScreen"
                performSegue(withIdentifier: "toLoseScreen", sender: nil)
            }
        }
        else{
            recordTextOutlet.text = record().getRecord(win: WinRec, loss: LossRec)
            roundTextOutlet.text = "Round: \(TrackRound)"
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLoseScreen"{
            let NVC = segue.destination as! LoseScreen
            NVC.imputLoseRecord = "\(WinRec)-\(LossRec)"
        }
        if segue.identifier == "toWinScreen"{
            let NVC = segue.destination as! WinScreen
            NVC.imputWinRecord = "\(WinRec)-\(LossRec)"
            print("\(WinRec)-\(LossRec)")
        }
    }

  
}

class record{
    var temp = 1
    func win(winReco:Int)->Int{
        return winReco + temp
        print("win \(winReco+temp)")
    }
    func tie(tracker:Int)->Int{
        return tracker - temp
    }
    
    func loss(losser:Int)->Int{
      
        return losser + temp
        print("loss \(losser+temp)")
    }
    
    
    
    func getRecord(win:Int,loss:Int)->String{
        return "Record: \(win)-\(loss)"
    }
    
    func finalRecord(win:Int,loss:Int)->String{
        if win > loss{
            return "winner"
        }
        else if loss > win{
            return "loser"
        }
        else{
            return ""
        }
    }
    func roundEnd(round:Int)->Int{
        return round + temp
    }
    func checkRound(tRound:Int,tempRound:Int)-> Bool{
        if tRound <= tempRound{
            return true
        }
        return false
    }
}
