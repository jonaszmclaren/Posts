//
//  Router.swift
//  AwesomeSwift4App
//
//  Created by Jonasz Baron on 12.10.2017.
//  Copyright © 2017 Jonasz Baron. All rights reserved.
//

import Foundation
import Alamofire

protocol Router: URLRequestConvertible {
	
	func url() -> URL?
	
	func httpMethod() -> HTTPMethod
	
	func parameters() -> [String: Any]?
	
	func encoding() -> ParameterEncoding
}

extension Router {
	
	func httpMethod() -> HTTPMethod {
		return .get
	}
	
	func parameters() -> [String: Any]? {
		return nil
	}
	
	func encoding() -> ParameterEncoding {
		switch httpMethod() {
		case .get:
			return URLEncoding.default
		default:
			return JSONEncoding.default
		}
	}
	
	func asURLRequest() throws -> URLRequest {
		guard let url = url() else {
			throw NSError(
				domain: "",
				code: -1,
				userInfo: [NSLocalizedDescriptionKey: "Could not get URL"]
			)
		}
		
		var urlRequest = URLRequest(url: url)
		urlRequest.httpMethod = httpMethod().rawValue
		
		return try encoding().encode(urlRequest, with: parameters())
	}
}
