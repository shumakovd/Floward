//
//  SecondVC.swift
//  Floward
//
//  Created by Shumakov Dmytro on 09.11.2022.
//

import UIKit

class SecondVC: BasicVC {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    // MARK: - Properties
    private var user = UserML()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        configureUI()
    }
    
    // MARK: - Methods
    
    func configureVC(_ user: UserML) {
        self.user = user
    }
    
    private func configureUI() {
        usernameLabel.text = user.name
        
        userImageView.layer.cornerRadius = 16
        userImageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        userImageView.setImage(url: user.url)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
                
        PostTVCell.registerForTableView(tableView: tableView)
        tableView.reloadData()
    }
}

extension SecondVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        user.posts?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTVCell.cellIdentifier, for: indexPath) as? PostTVCell else { return UITableViewCell() }
         
        let title = user.posts?[indexPath.row].title ?? ""
        let body = user.posts?[indexPath.row].body ?? ""
        
        cell.configureCell(title: title, body: body)
        
        return cell
    }
    
    func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
