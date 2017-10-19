//
//  ViewController.swift
//  AwesomeSwift4App
//
//  Created by Jonasz Baron on 11.10.2017.
//  Copyright © 2017 Jonasz Baron. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
	
	// MARK: - IBOutlets
	
	@IBOutlet weak var tableView: UITableView!
	
	
	// MARK: - Properties
	
	var posts: Variable<[Post]> = Variable([])
	let postService = PostService()
	let disposeBag = DisposeBag()
	
	
	// MARK: - Methods
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupRx()
	}
	
	private func setupRx() {
		posts.asObservable()
			.bind(to: tableView.rx.items(cellIdentifier: PostCell.cellIdentifier, cellType: PostCell.self)) { (row, post, cell) in
				cell.setup(withPost: post)
			}
			.disposed(by: disposeBag)
		
		tableView.rx
			.modelSelected(Post.self)
			.subscribe(onNext: { [weak self] post in
				self?.presentPostDetails(withId: post.id)
				self?.tableView.deselectSelectedRow()
			})
			.disposed(by: disposeBag)

		postService.getAllPosts()
			.bind(to: posts)
			.disposed(by: disposeBag)
	}
	
	private func presentPostDetails(withId id: Int) {
		guard let detailsViewController = storyboard?.instantiateViewController(withIdentifier: "PostDetailsViewController") as? PostDetailsViewController else {
			return
		}
		
		detailsViewController.postId = id
		
		navigationController?.pushViewController(detailsViewController, animated: true)
	}
}
