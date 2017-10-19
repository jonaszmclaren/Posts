//
//  PostService.swift
//  AwesomeSwift4App
//
//  Created by Jonasz Baron on 11.10.2017.
//  Copyright © 2017 Jonasz Baron. All rights reserved.
//

import Foundation
import RxSwift

class PostService {
	
	let restService = RestService()
	
	
	func getAllPosts() -> Observable<[Post]> {
		return restService.getObjectsArray(route: PostRouter.getAll)
	}
	
	func getPost(withId id: Int) -> Observable<Post> {
		return restService.getObject(route: PostRouter.get(id))
	}
	
	func create(post: Post) {
		
	}
}
