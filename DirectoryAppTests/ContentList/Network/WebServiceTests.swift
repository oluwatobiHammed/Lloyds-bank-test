//
//  PeopleWebServiceTests.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 29/07/2021.
//

import XCTest
import RxSwift
@testable import DirectoryApp

class WebServiceTests: XCTestCase {
    var sut: VMRoute!
    var disposeBag: DisposeBag!
    var peopleResponses: PublishSubject<[ContentListResponse]>!
    var baseNetwork: BaseNetWorkProtocol!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        disposeBag = DisposeBag()
        peopleResponses  = PublishSubject()
        baseNetwork = BaseNetWorkServices()
        sut = VMRoute(baseNetwork: baseNetwork, urlSession: config)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        disposeBag = nil
        baseNetwork = nil
        
    }
    
    func testPeopleWebService_WhenGivenSuccessfullResponse_ReturnsSuccess() {
        MockURLProtocol.requestHandler = { request in
         
            let response = HTTPURLResponse.init(url: request.url!, statusCode: 200, httpVersion: "2.0", headerFields: nil)!
            return (response, Bundle.main.decode(from: "ContentListResponse.json"))
        }
        let expectation = self.expectation(description: "getContentList Web Service Response Expectation")
        // Act
        sut.getContentList(url: RemoteApiConstants.Endpoints.getContentList.stringValue).subscribe { res in
            // Assert
            
                XCTAssertEqual(res.data?.items?.first?.title, "Article 8")
                
            
            expectation.fulfill()
        } onError: { err in
            
        }.disposed(by: disposeBag)
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testPeopleWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        // Arrange
        let exampleData = """
    [{"base": "EUR",
      "date": "2018-04-08",
      "rates": {
        "CAD": 1.565,
        "CHF": 1.1798,
        "GBP": 0.87295,
        "SEK": 10.2983,
        "EUR": 1.092,
        "USD": 1.2234
      }
    }]
    """.data(using: .utf8)!
        MockURLProtocol.requestHandler = { request in
         
            let response = HTTPURLResponse.init(url: request.url!, statusCode: 200, httpVersion: "2.0", headerFields: nil)!
            return (response, exampleData)
        }
        let expectation = self.expectation(description: "GetPeople() method expectation for a response that contains a different JSON structure")
        // Act
        sut.getContentList(url: RemoteApiConstants.Endpoints.getContentList.stringValue).subscribe { res in
            // Assert
            
            res.data?.items?.forEach({ res in
                XCTAssertNil(res.date, "The response model for a request containing unknown JSON response, should have been nil")
            })
            expectation.fulfill()
        } onError: { error in
            XCTAssertEqual(error.localizedDescription, "The data couldn’t be read because it isn’t in the correct format.", "The GetPeople() method did not return expected error")
            expectation.fulfill()
        }.disposed(by: disposeBag)
        self.wait(for: [expectation], timeout: 5)
    }


    
     func testGetPeopleWebservice_WhenEmptyURLStringProvided_ReturnsError() {
      
        // Arrange
        let urlString = ""
        let expectation = self.expectation(description: "An empty request URL string expectation")
        // Act
        print("code excuted")
        sut.getContentList(url: urlString).subscribe { res in
           
            // Assert
            res.data?.items?.forEach({
                XCTAssertNil($0.id, "When an invalidRequestURLString takes place, the response model must be nil")
                
            })
            expectation.fulfill()
        } onError: { error in
            XCTAssertEqual(error.localizedDescription, "URL is not valid: ", "The getPeople() method did not return an expected error for an invalidRequestURLString error")
            expectation.fulfill()
        }.disposed(by: disposeBag)
        
        self.wait(for: [expectation], timeout: 2)
    }
    

    


}
