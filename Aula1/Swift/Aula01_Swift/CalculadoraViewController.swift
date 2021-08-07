//
//  CalculadoraViewController.swift
//  Aula01_Swift
//
//  Created by IOS SENAC on 31/07/21.
//

import UIKit

class CalculadoraViewController: UIViewController {
    
    @IBOutlet weak var txtValor: UITextField!
    
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func evaluate(_ sender: Any) {
        
        var message = ""
                
        if let value = txtValor.text {
            let dValue = Double(value)
            let evaluation = dValue! * 2
            lblResult.text = String(evaluation)
            message = "O resultado é: " + String(evaluation)
        } else {
            message = "Faiou"
        }
        
        let alert = UIAlertController(title: "Calculado", message: message, preferredStyle: .alert)
        let btnOk = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(btnOk)
        present(alert, animated: true , completion: nil)
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
