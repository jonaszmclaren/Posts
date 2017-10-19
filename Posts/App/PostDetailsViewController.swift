//
//  PostDetailsViewController.swift
//  AwesomeSwift4App
//
//  Created by Jonasz Baron on 12.10.2017.
//  Copyright © 2017 Jonasz Baron. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PostDetailsViewController: UIViewController {

	// MARK: - IBOutlets
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var bodyLabel: UILabel!
	
	
	// MARK: - Properties
	
	var postId = 0
	var post: Variable<Post> = Variable(Post())
	let postService = PostService()
	let disposeBag = DisposeBag()

	
	// MARK: - Methods
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		setupRx()
    }
	
	private func setupRx() {
		postService.getPost(withId: postId)
			.bind(to: post)
			.disposed(by: disposeBag)
		
		post.asObservable()
			.map { $0.title }
			.bind(to: titleLabel.rx.text)
			.disposed(by: disposeBag)
		
		post.asObservable()
			.map { $0.body }
			.bind(to: bodyLabel.rx.text)
			.disposed(by: disposeBag)
	}
}
