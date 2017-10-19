//
//  Extensions.swift
//  AwesomeSwift4App
//
//  Created by Jonasz Baron on 11.10.2017.
//  Copyright © 2017 Jonasz Baron. All rights reserved.
//

import UIKit
import RxSwift

extension UITableView {
	
	func deselectSelectedRow() {
		if let indexPath = indexPathForSelectedRow {
			deselectRow(at: indexPath, animated: true)
		}
	}
}

extension ObservableType {
	
	func mapObject<T: Codable>(type: T.Type) -> Observable<T> {
		return flatMap { data -> Observable<T> in
			let responseTuple = data as? (HTTPURLResponse, Data)

			guard let jsonData = responseTuple?.1 else {
				throw NSError(
					domain: "",
					code: -1,
					userInfo: [NSLocalizedDescriptionKey: "Could not decode object"]
				)
			}
			
			let decoder = JSONDecoder()
			let object = try decoder.decode(T.self, from: jsonData)
			
			return Observable.just(object)
		}
	}
	
	func mapArray<T: Codable>(type: T.Type) -> Observable<[T]> {
		return flatMap { data -> Observable<[T]> in
			let responseTuple = data as? (HTTPURLResponse, Data)
			
			guard let jsonData = responseTuple?.1 else {
				throw NSError(
					domain: "",
					code: -1,
					userInfo: [NSLocalizedDescriptionKey: "Could not decode object"]
				)
			}
			
			let decoder = JSONDecoder()
			let objects = try decoder.decode([T].self, from: jsonData)
			
			return Observable.just(objects)
		}
	}
}
