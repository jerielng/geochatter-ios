//
//  MyPostsViewController.swift
//  Geochatter
//
//  Created by Jeriel Ng on 11/7/20.
//  Copyright © 2020 Jeriel Ng. All rights reserved.
//

import UIKit

class MyPostsViewController: UIViewController {
    @IBOutlet weak var postsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MyPostsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
