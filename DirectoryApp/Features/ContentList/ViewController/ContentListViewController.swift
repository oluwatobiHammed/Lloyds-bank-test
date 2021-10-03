//
//  SecondViewController.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 06/07/2021.
//

import UIKit
import RxSwift
import RxCocoa


class ContentListViewController: BaseViewController, UIScrollViewDelegate, UITableViewDelegate {
    var validateDisposable: Disposable?
    @IBOutlet weak var tableview: UITableView!
    var contentViewModel: IContentListViewModel?
    override func getViewModel() -> BaseViewModel {
        return self.contentViewModel as! BaseViewModel 
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPeople()
        tableview.rx.setDelegate(self).dispose()
        tableview.separatorStyle = .none
        tableview.register(UINib(nibName: ContentListTableViewCell.Identifier, bundle: nil), forCellReuseIdentifier:  ContentListTableViewCell.Identifier)
        contentViewModel?.getContentList()
    }
    
    
    
    func getPeople()  {
        title = "Content List"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableview.contentInsetAdjustmentBehavior = .never
       
        contentViewModel?.getContentList()
        self.validateDisposable  = contentViewModel?.contentResponses.observeOn(MainScheduler.instance).bind(to: self.tableview.rx.items(cellIdentifier: ContentListTableViewCell.Identifier, cellType: ContentListTableViewCell.self)) { (tableView, element, cell) in
            
                cell.config(element)
           
            cell.addTapGesture {
                let _ = StoryBoardsID.boardMain.requestNavigation(to: ViewControllerID.ContentViewController , requestData: element.id)
            }
            
        }
    
        
    }
    

    
    
    
    
}
