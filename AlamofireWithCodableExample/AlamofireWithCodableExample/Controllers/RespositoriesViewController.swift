//
//  RespositoriesViewController.swift
//  AlamofireWithCodableExample
//
//  Created by Marcos Lacerda on 12/09/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

import UIKit

class RespositoriesViewController: UIViewController {
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var progress: UIActivityIndicatorView!
    
    fileprivate var repositories = [Repositories]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Alamofire + Codable Example"
        
        tableView.register(UINib(nibName: "RepositoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "RepoCell")
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    @IBAction fileprivate func searchClick() {
        if searchField.text!.isEmpty {
            self.showErrorMessage()
            return
        }
        
        progress.isHidden = false
        progress.startAnimating()
        
        RepositorieServices.shared.loadRepositories(searchField.text!) { (repositories, error) in
            self.progress.stopAnimating()
            
            if let errorMessage = error {
                print(errorMessage)
                return
            }
            
            guard let items = repositories else { return }
            
            self.repositories.removeAll()
            self.repositories.append(contentsOf: items)
            
            if self.repositories.count == 0 {
                self.showEmptyMessage()
                return
            }
            
            self.tableView.isHidden = false
            self.tableView.reloadData()
        }
    }
    
    fileprivate func showErrorMessage() {
        let controller = UIAlertController(title: "Error", message: "The term can not be blank", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (alert) in
            self.searchField.becomeFirstResponder()
        }
        
        controller.addAction(ok)
        self.navigationController?.present(controller, animated: true, completion: nil)
    }
    
    fileprivate func showEmptyMessage() {
        let controller = UIAlertController(title: "Alert", message: "No repositories found with term. Please try again with another term", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (alert) in
            self.searchField.text = ""
            self.searchField.becomeFirstResponder()
        }
        
        controller.addAction(ok)
        self.navigationController?.present(controller, animated: true, completion: nil)
    }

}

extension RespositoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell") as? RepositoriesTableViewCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        cell.initWithRepositorie(repositories[indexPath.row])
        
        return cell
    }
    
}
