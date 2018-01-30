//
//  ServerConfigViewController.swift
//  WebApp
//
//  Created by Rodrigo Mato on 09/01/2018.
//  Copyright © 2018 Rodrigo Mato. All rights reserved.
//

import UIKit
import SpriteKit

class ServerConfigViewController: UIViewController {

    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var warningLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func connectTapped(_ sender: Any) {
        guard self.validateServerUrl() else {
            spawnWarningBanner()
            return
        }
        
        self.performSegue(withIdentifier: "webViewSegue", sender: self)
    }
    
    func validateServerUrl() -> Bool {
        if let urlString = urlTextField.text, !urlString.isEmpty {
            return !urlString.isEmpty && urlString.contains("http")
        }
        return false
    }
    
    func spawnWarningBanner() {
        
        let animationDuration = 0.5
        let delay : TimeInterval = 2
        
        UIView.animate(withDuration: animationDuration, animations: { [weak self] () -> Void in
            self?.warningLabel.alpha = 1
            
        }) { (Bool) -> Void in
            
            UIView.animate(withDuration: animationDuration, delay: delay, options: .curveEaseInOut, animations: { [weak self] () -> Void in
                self?.warningLabel.alpha = 0
            }, completion: nil)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "webViewSegue",
            let webController = segue.destination as? WebViewController,
            let serverURL = urlTextField.text {
            
            webController.serverUrl = serverURL
        }
    }
 

}
