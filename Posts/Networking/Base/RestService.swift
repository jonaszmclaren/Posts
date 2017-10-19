//
//  RestService.swift
//  AwesomeSwift4App
//
//  Created by Jonasz Baron on 11.10.2017.
//  Copyright © 2017 Jonasz Baron. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire

class RestService {
	
	func getObject<T: Codable>(route: URLRequestConvertible) -> Observable<T> {
		return RxAlamofire.requestData(route)
			.mapObject(type: T.self)
	}
	
	func getObjectsArray<T: Codable>(route: URLRequestConvertible) -> Observable<[T]> {
		return RxAlamofire.requestData(route)
			.mapArray(type: T.self)
	}
}
