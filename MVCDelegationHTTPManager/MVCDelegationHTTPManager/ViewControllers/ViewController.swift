//
//  ViewController.swift
//  MVCDelegationHTTPManager
//
//  Created by Jyoti on 25/08/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelDownloaded: UILabel!
    
    var dataDownloaded = 0 {
        didSet {
            DispatchQueue.main.async(execute: {
                [weak self] () -> Void in
                guard let  self = self else {return}
                self.labelDownloaded.text = "Objects downloaded : \(self.dataDownloaded)"
            })
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonAPICallClicked(_ sender: UIButton) {
        DelegationHTTPManager.shared.delegateHTTP = self
        DelegationHTTPManager.shared.get(urlString: baseUrl + breachesExtensionURL )
     }
}

extension ViewController : DelegationHTTPDelegate {
    func didDownloadBreached(_ data: Data) {
        dataDownloaded += data.count
    }
}


