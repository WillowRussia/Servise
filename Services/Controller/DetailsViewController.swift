//
//  DetailsViewController.swift
//  Services
//
//  Created by Willow on 18.02.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var item: API.Item?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var textView: UILabel!
    @IBOutlet weak var urlButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = item!.name
        imageView.sd_setImage(with: URL(string: item!.iconURL))
        titleView.text = item!.name
        textView.text = item!.description
        urlButton.setTitle(item!.serviceURL, for: .normal)
    }
    
    @IBAction func openURL(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: item!.serviceURL)! as URL, options: [:], completionHandler: nil)
    }
    
}
