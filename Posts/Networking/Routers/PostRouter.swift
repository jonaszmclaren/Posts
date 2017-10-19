//
//  PostRouter.swift
//  AwesomeSwift4App
//
//  Created by Jonasz Baron on 11.10.2017.
//  Copyright © 2017 Jonasz Baron. All rights reserved.
//

import Foundation
import Alamofire

enum PostRouter: Router {
    case getAll
    case get(Int)
    case create(Post)
    case delete(Int)
	
	func url() -> URL? {
		let relativePath: String?
		
		switch self {
		case .getAll, .create:
			relativePath = "\(Constants.postPath)"
		case .get(let number):
			relativePath = "\(Constants.postPath)/\(number)"
		case .delete(let number):
			relativePath = "\(Constants.postPath)/\(number)"
		}
		
		var finalURL = URL(string: Constants.baseURLString)
		
		if let relativePath = relativePath {
			finalURL = finalURL?.appendingPathComponent(relativePath)
		}
		
		return finalURL
	}
	
	func httpMethod() -> HTTPMethod {
		switch self {
		case .get, .getAll:
			return .get
		case .create:
			return .post
		case .delete:
			return .delete
		}
	}
	
	func parameters() -> [String: Any]? {
		let jsonEncoder = JSONEncoder()
		
		switch self {
		case .get, .delete, .getAll:
			return nil
		case .create(let post):
			do {
				let jsonData = try jsonEncoder.encode(post)
				return try JSONSerialization.jsonObject(with: jsonData) as? [String: Any]
			} catch {
				print(error.localizedDescription)
			}
			
			return nil
		}
	}
}
