//
//  ViewController.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-24.
//

import UIKit

class ListViewController: BaseViewController {
    
    override func setupUI() {
        super.setupUI()
        
        self.createTableView()
    }
    
    private func createTableView() {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        
        tableView.register(CommonCell.self, forCellReuseIdentifier: "episodeCell")
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200))
        tableView.tableHeaderView?.backgroundColor = .red
        tableView.dataSource = self
        tableView.delegate = self
    }

    @objc private func pressed() {
        self.navigationController?.pushViewController(DetailsViewController(),
                                                      animated: true)
    }

}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as! CommonCell
        cell.jobTitleDetailedLabel.text = "ja"
        return cell
    }
}

extension ListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return BaseViewController.contentShow.groupedBySeason().count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let group = BaseViewController.contentShow.groupedBySeason()
        return group[section]?.count ?? 0
    }
    
}

