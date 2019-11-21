//
//  APIManager.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 19.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
	case get    = "GET"
	case post   = "POST"
}

/// Struct containing elements that are necessary to make a request
struct RequestElements {
	var url             : URL
	var parameters      : [String: Any]?
	var headers         : [String: String]?

	init(url: URL, parameters: [String: Any]? = nil, headers: [String: String]?) {
		self.url = url
		self.parameters = parameters
		self.headers = headers
	}
}

protocol APIManagerProtocol {

	func get(requestElements: RequestElements, success: ((_ response: Any?) -> Void)?, failure: ((_ error: Error) -> Void)?)
}

class APIManager {

	static let shared = APIManager()

	private init() {
	}
}

// MARK: - Implementation APIManager Protocol

extension APIManager: APIManagerProtocol {

	func get(requestElements: RequestElements, success: ((_ response: Any?) -> Void)?, failure: ((_ error: Error) -> Void)?) {
        self.prepareAndSendRequest(requestElements: requestElements, httpMethod: .get, success: success, failure: failure)
    }
}

// MARK: - Create request

extension APIManager {
    
    private func request(url: URL, httpMethod: HTTPMethod, headers: [String: String]?) -> URLRequest {
        
        var request = URLRequest(url: url)
        headers?.forEach({ (key: String, value: String) in
            request.setValue(value, forHTTPHeaderField: key)
        })
        
        request.httpMethod = httpMethod.rawValue
        return request
    }
    
    private func prepareAndSendRequest(requestElements: RequestElements,
                                              httpMethod: HTTPMethod,
                                              success: ((_ response: Any?) -> Void)?,
                                              failure: ((_ error: Error) -> Void)?) {
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration)
        
        guard let url = self.urlComponents(url: requestElements.url, parameters: requestElements.parameters)?.url else {
			failure?(APIManager.Invalid.format.localizedError)
            return
        }
        
        let request = self.request(url: url, httpMethod: httpMethod, headers: requestElements.headers)
        let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                failure?(error)
                return
            }

            success?(data)
        }

        task.resume()
    }
    
    private func urlComponents(url: URL, parameters: [String: Any]?) -> URLComponents? {
        
        var urlComponents = URLComponents(string: url.absoluteString)
        urlComponents?.queryItems = self.queryItems(parameters: parameters)
        
        return urlComponents
    }
    
    private func queryItems(parameters: [String: Any]?) -> [URLQueryItem] {
        
        var queryItems = [URLQueryItem]()
        parameters?.forEach({ (key: String, value: Any) in
            queryItems.append(URLQueryItem(name: key, value: value as? String))
        })
        
        return queryItems
    }
}

// MARK: - Error cases

extension APIManager {
	
	enum Invalid {
		case format
		
		var localizedError		: Error {
			let domain = (Bundle.main.bundleIdentifier ?? "BitcoinTBO")
			return NSError(domain: domain, code: self.code, userInfo: [NSLocalizedDescriptionKey: self.message])
		}
		
		private var code		: Int {
			switch self {
			case .format		: return 3000
			}
		}
		
		private var message		: String {
			switch self {
			case .format		: return NSLocalizedString("Wrong.format", comment: "")
			}
		}
	}
}
