//
//  ViewController.swift
//  NewsProject
//
//  Created by Macbook on 18.02.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private var newsTableViewModal : NewsTableViewModal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        veriAl()
        
        }
    func veriAl() {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json")
        
        WebService().haberleriIndir(url: url!) { (haberler) in
            if let haberler = haberler {
                self.newsTableViewModal = NewsTableViewModal(newsList: haberler)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
    }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableViewModal == nil ? 0 : self.newsTableViewModal.numberOfRowsInSection()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsCell
        let newsViewModal = self.newsTableViewModal.newsAtIndexPath(indexPath.row)
        cell.titleLabel.text = newsViewModal.title
        cell.storyLabel.text = newsViewModal.story
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}

