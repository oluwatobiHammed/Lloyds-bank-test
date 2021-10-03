//
//  PeopleRepo.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 07/08/2021.
//

import XCTest
@testable import DirectoryApp
class ContentListRepoTest: XCTestCase {

    var sut: ContentListRepoImpl!
    var mockVMRoute: MockVMRoute!
    var baseNetWorkProtocol: BaseNetWorkProtocol!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockVMRoute = MockVMRoute()
        sut = ContentListRepoImpl(vmRouteProtocol: mockVMRoute)
       
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testcontentListRepo_WhenCalled_ShouldCallGetContentList() {
        // Arrange
        
        // Act
        sut.getContentList()

        // Assert
        XCTAssertTrue(mockVMRoute.isGeMethodCalled, "The getContentList() method was not called in the ContentListRepo class")

        

    }

}
