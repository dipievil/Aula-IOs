//
//  RefactorViewController.swift
//  Factorizator
//
//  Created by IOS SENAC on 31/07/21.
//

import UIKit

class RefactorViewController: UIViewController {
    
    @IBOutlet weak var txtNumber: UITextField!
         
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func refatorar(_ sender: Any) {
        var message = ""
                
        if let value = txtNumber.text {
            var f = Int(value)
            //let evaluation = dValue! * 2
            
            var factorial = 5
            
            repeat {
                factorial = factorial*(f!-1);
                f = f!-1;
            }
            while f!>1
            
            message = "O valor é: \(factorial)"
        } else {
            message = "Faiou"
        }
        
        let alert = UIAlertController(title: "Resultado", message: message, preferredStyle: .alert)
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
