//
//  AddReviewsVC.swift
//  shamo
//
//    Created by Shamo Zahidov on 04/12/2021.
//

import UIKit
import Cosmos
import KMPlaceholderTextView

class AddReviewsVC: UIViewController {
    
    @IBOutlet weak var cosmosView: CosmosView!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var nameFIeld: UITextField!
    @IBOutlet weak var commentTextView: KMPlaceholderTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameFIeld.becomeFirstResponder()
        
    }
    
    @IBAction func didTabClose(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapSave(_ sender: UIButton) {
        let model = ReviewsModel(message: commentTextView.text, stars: String(cosmosView.rating), userId: UUID().uuidString, userName: nameFIeld.text ?? "", time: Util.getCurrentMillis())
        let vc = SaveReviewVC.initFromStoryboard(.Main) as! SaveReviewVC
        vc.dataModel = model
        self.present(vc, animated: true) { [weak self] in
            guard let self = self else { return }
            self.nameFIeld.text = ""
            self.commentTextView.text = ""
        }
    }
}
