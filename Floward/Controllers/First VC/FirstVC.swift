//
//  FirstVC.swift
//  Floward
//
//  Created by Shumakov Dmytro on 09.11.2022.
//

import UIKit

class FirstVC: BasicVC {
                
    // MARK: - Properties
    
    private var users: [UserML] = []
    private var posts: [PostML] = []
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        getData()
    }
    
    // MARK: - Methods
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        UserTVCell.registerForTableView(tableView: tableView)        
    }
    
    // MARK: - API Methods

    private func getData() {
        
        var queue: OperationQueue {
            let queue = OperationQueue()
            queue.maxConcurrentOperationCount = 1
            queue.qualityOfService = .userInitiated
            return queue
        }

        let resultBlock = BlockOperation {
            DispatchQueue.main.sync {
                self.tableView.reloadData()
            }
        }

        let postBlock = BlockOperation {
            self.getPosts() {
                queue.addOperation(resultBlock)
            }
        }

        let userBlock = BlockOperation {
            self.getUsers() {
                queue.addOperation(postBlock)
            }
        }

        queue.addOperation(userBlock)
    }
  
    private func getUsers(completion: @escaping () -> Void) {
        print("• Get Users Start")
        APIManager.shared().getUsers { [weak self] (result: APIManager.Result<[UserML]>) in
            guard let strongSelf = self else { return }
            
            switch result {
            case let .success(data):
                
                strongSelf.users = data
                
            case let .failure(error):
                print("Error: ", error)
            }
            completion()
        }
    }
    
    private func getPosts(completion: @escaping () -> Void) {
        print("• Get Posts Start")
        APIManager.shared().getPosts { [weak self] (result: APIManager.Result<[PostML]?>) in
            guard let strongSelf = self else { return }
            
            switch result {
            case let .success(data):
                guard let posts = data else { return }
                
                for i in 0 ..< strongSelf.users.count {
                    strongSelf.users[i].posts = posts.filter({$0.userId == strongSelf.users[i].userId})
                }
                
            case let .failure(error):
                print("Error: ", error)
            }
            completion()
        }
    }
    
}

extension FirstVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTVCell.cellIdentifier, for: indexPath) as? UserTVCell else { return UITableViewCell() }
                
        let name = users[indexPath.row].name
        let count = users[indexPath.row].posts?.count
        let image = users[indexPath.row].thumbnailUrl
                
        cell.configureCell(name: name ?? "", count: count ?? 0, image: image ?? "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "SecondVC") as? SecondVC else { return }
                
        let user = users[indexPath.row]
                        
        vc.configureVC(user)
        present(vc, animated: true)
    }
    
    func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }    
}

