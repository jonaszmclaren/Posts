//
//  PostCell.swift
//  AwesomeSwift4App
//
//  Created by Jonasz Baron on 12.10.2017.
//  Copyright © 2017 Jonasz Baron. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

	// MARK: - IBOutlets
	
	@IBOutlet weak var titleLabel: UILabel!
	
	
	// MARK: - Properties
	
	static let cellIdentifier = "PostCell"
	
	
	// MARK: - Methods
	
	func setup(withPost post: Post) {
		titleLabel.text = post.title
	}
}
