//
//  PostsListViewController.swift
//  KhaznaTask
//
//  Created by Mark Shafik on 26/08/2024.
//


import UIKit

class PostsListViewController: UIViewController {
    
    var presenter: PostsListPresenterProtocol?
    
    // MARK: - iPrivate
    
    private var posts: [Post] = []
    private let tableView = UITableView()
    private let refreshControl = UIRefreshControl()
    private var isCachedData = false
    
    // MARK: - iConstant
    
    let activityView = UIActivityIndicatorView(style: .large)
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configureTableView()
        
        presenter?.viewDidLoad()
        // Hide the back button
        self.navigationItem.hidesBackButton = true
        // Set Title
        self.title = "Khazna"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
    }
    
    // MARK: - Configure TableView
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
    }
    
    private func setupUI() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshPosts), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc private func refreshPosts() {
        presenter?.didPullToRefresh()
    }
    
    func showLoadingIndicator() {
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()
    }
    
    func hideLoadingIndicator() {
        // Hide loading indicator
        DispatchQueue.main.async {
            self.activityView.stopAnimating()  // Ensure UI updates on the main thread
        }
    }
    
    func getCurrentPosts() -> [Post] {
        return posts
    }
    
    func clearPosts() {
        self.posts.removeAll()  // Clear the posts array
        tableView.reloadData()   // Refresh the table view
    }
    
    // Show error maessage
    func showError(message: String) {
        // Handle showing error message to user, e.g., an alert
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}

//MARK: - TableView Dtatasource

extension PostsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        cell.configure(with: posts[indexPath.row])
        
        // Disable Scrolling
        if !isCachedData {
            if indexPath.row == self.posts.count - 1 {
                presenter?.loadMorePosts()
            }
        }
        // Disable selection style
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - TableView Delegate

extension PostsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        debugPrint("Post selected: \(post.title)")
        presenter?.didSelectPost(post: post)
    }
}

extension PostsListViewController: PostsListViewProtocol {
    
    func displayPosts(_ posts: [Post], isCached: Bool) {
        debugPrint("Posts count before appending: \(self.posts.count)")
        self.posts.append(contentsOf: posts)
        debugPrint("Posts count after appending: \(self.posts.count)")
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.tableView.refreshControl?.endRefreshing()
            
            // Disable scrolling if cached data is used
            self.isCachedData = isCached
        }
    }
}
