//
//  RoomViewController.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import UIKit
import RxSwift
import RxCocoa

class ContentViewController: BaseViewController {
    
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var bodyLable: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var validateDisposable: Disposable?
    var contentViewModel: IContentViewModel?
    var requestData: Int?
    
    override var presentRequestData: Any?{
        didSet {
            requestData = presentRequestData as? Int
        }
    }
    
    override func getViewModel() -> BaseViewModel {
        return self.contentViewModel as! BaseViewModel
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Content"
        // Do any additional setup after loading the view.
        getContent()
        
    }
    
    func getContent()  {
        contentViewModel?.getContent(id: requestData ?? 0)
        
        validateDisposable = contentViewModel?.contentResponses.bind(onNext: { [weak self] in
            self?.titleLable.text = $0.title
            self?.subtitleLabel.text = $0.subtitle
            self?.bodyLable.text = $0.body
            self?.dateLabel.text = $0.date
        })
    }
}
