//
//  MockPeopleRepo.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 28/07/2021.
//

import XCTest
import RxSwift
@testable import DirectoryApp
var item = Items(id: 33, title: "Article 5", subtitle: "Article 5 subtitle with placeholder text", date: "15/04/2013 11:48")
class MockContentListRepo: IContentListRepo {
    let config = URLSessionConfiguration.ephemeral
    var baseNetwork: BaseNetWorkProtocol!
    var remote: VMRoute!
    var isGetPeopleMethodCalled: Bool = false
    var expectation: XCTestExpectation?
    func getContentList() -> Observable<ApiResponse<ContentListResponse>> {
        config.protocolClasses = [MockURLProtocol.self]
        baseNetwork = BaseNetWorkServices()
        remote = VMRoute(baseNetwork: baseNetwork, urlSession: config)
        isGetPeopleMethodCalled = true
        expectation?.fulfill()
        return remote.getContentList(url: RemoteApiConstants.Endpoints.getContentList.stringValue)
    }

}
