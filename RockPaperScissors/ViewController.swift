import UIKit

class ViewController: UIViewController {
    var segmentTotal = 0
    @IBOutlet weak var textFIeldNameOutlet: UITextField!
    var heroName = ""
    var total = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
    }

    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        segmentTotal = sender.selectedSegmentIndex
        switch segmentTotal {
        case 0:
            print("you selected 1 round")
            total = 1
        case 1:
            print("you selected 3 rounds")
            total = 3
        case 2:
            print("you selected 9 rounds")
            total = 9
        default:
            print("you didnt select anything")
        }
    }
    @IBAction func startButton(_ sender: UIButton) {
        heroName = textFIeldNameOutlet.text ?? ""
        if segmentTotal < 0 {
            let alertController = UIAlertController(title: "Alert", message: "didnt select rounds", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) {
                (action: UIAlertAction!) in
               
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
       else if heroName == "" {
            let alertController = UIAlertController(title: "Alert", message: "you didnt enter name", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) {
                (action: UIAlertAction!) in
               
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            performSegue(withIdentifier: "toGameScreenSegue", sender: nil)
            
        }
      
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let NVC = segue.destination as! PlayScreenViewController
        NVC.imputName = heroName
        NVC.imputRounds = total
    }
}

