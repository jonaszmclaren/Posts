//
//  Comment.swift
//  AwesomeSwift4App
//
//  Created by Jonasz Baron on 11.10.2017.
//  Copyright © 2017 Jonasz Baron. All rights reserved.
//

import Foundation

class Comment: Codable {
	var id: String = ""
	var postId: Int = 0
	var text: String = ""
	var timestamp: Int = 0
}
