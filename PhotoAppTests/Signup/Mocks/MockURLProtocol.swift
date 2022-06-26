//
//  MockURLProtocol.swift
//  PhotoAppTests
//
//  Created by Mohamed osama on 26/06/2022.
//

import Foundation

class MockURLProtocol: URLProtocol{
    
    static var stubResponseData: Data?
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let error = MockURLProtocol.error{
            self.client?.urlProtocol(self, didFailWithError: error)
        }else{
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        
    }
}
