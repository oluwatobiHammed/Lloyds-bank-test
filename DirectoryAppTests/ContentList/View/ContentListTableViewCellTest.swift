//
//  PeopleTableViewCellTest.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 03/08/2021.
//

import XCTest
@testable import DirectoryApp
class ContentListTableViewCellTest: XCTestCase {
    
    var cell:ContentListTableViewCell!
    var content: Items!
    var storyboard: UIStoryboard!
    var contentListViewModel: MockContentListViewModel!
    var sut: ContentListViewController!
    var item: ItemsViewModel!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
       
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: ViewControllerID.ContentListViewController.rawValue) as ContentListViewController
        content = Items(id: 32, title: "Article 4", subtitle: "Article 4 subtitle with placeholder text", date: "14/04/2013 11:48")
        item = ItemsViewModel(items: content)
        contentListViewModel = MockContentListViewModel()
        _ = sut.view
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
         sut = nil
         cell = nil
         content = nil
    }
    
    func testContentListViewController_WhenCreated_HasRequiredTableView() throws {
        XCTAssertNotNil(sut.tableview, "Controller should have a tableview")
        XCTAssertEqual(.none, sut.tableview.separatorStyle)
        
    }
    
 
    
    func testCellForRow() {
        sut.tableview.register(UINib(nibName: ContentListTableViewCell.Identifier, bundle: nil), forCellReuseIdentifier:  ContentListTableViewCell.Identifier)
        let cell = sut.tableview.dequeueReusableCell(withIdentifier: ContentListTableViewCell.Identifier)
        XCTAssertNotNil(cell,"TableView should be able to dequeue cell with identifier: '\(ContentListTableViewCell.Identifier)'")

    }
    

    
    func testCustomCell() throws {
            let customCell: ContentListTableViewCell = sut.tableview.dequeueReusableCell()
            XCTAssertNotNil(customCell, "No Custom Cell Available")
        
        let titleLabel = try XCTUnwrap(customCell.titleLabel, "The customCell is not connected to an IBOutlet")
        let subTitleLabel = try XCTUnwrap(customCell.subTitleLabel, "The customCell is not connected to an IBOutlet")
        let dateLabel = try XCTUnwrap(customCell.dateLabel, "The customCell is not connected to an IBOutlet")
        XCTAssertEqual(titleLabel.text, "", "Title Label was not empty when the view controller initially loaded")
        XCTAssertEqual(subTitleLabel.text, "", "Subtitle Label was not empty when the view controller initially loaded")
        XCTAssertEqual(dateLabel.text, "", "Date Label was not empty when the view controller initially loaded")
        
        customCell.config(item)
        XCTAssertEqual(titleLabel.text, item.title, "Title Label suppose  to  be equal to the value of content title")
        XCTAssertEqual(subTitleLabel.text, item.subtitle, "Subtitle Label  suppose  to  be equal to the value of content subtitle")
        XCTAssertEqual(dateLabel.text, item.date, "Date Label  suppose  to  be equal to the value of Content Date")
        
        }
    
    func testViewModel() throws {
        contentListViewModel.getContentList()
      XCTAssertTrue(contentListViewModel.isGetPeopleMethodCalled)
       
    }
    

}
