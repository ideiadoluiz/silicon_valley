//
//  ViewController.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-24.
//

import UIKit

class ListViewController: BaseViewController {
    
    private weak var tableView: UITableView?
    
    override func setupUI() {
        super.setupUI()
        
        self.createTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView?.reloadData()
    }
    
    private func createTableView() {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        
        UIView.addFitContraints(to: tableView, from: view)
        tableView.register(CommonCell.self, forCellReuseIdentifier: "episodeCell")
        setupHeaderView(tableView: tableView)
        
        tableView.tableHeaderView?.backgroundColor = .red
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView = tableView
    }
    
    private func setupHeaderView(tableView: UITableView) {
        let show = BaseViewController.contentShow
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 220)
        tableView.tableHeaderView = HeaderView(frame: frame,
                                               title: show.name!,
                                               imageUrl: show.image.medium!,
                                               summary: show.summary!,
                                               countSeasons: self.numberOfSections(in: tableView),
                                               countEpisodes: show.episodes.count)
    }
    
    @objc func toggle(sender: UIButton) {
        self.toggleIsFavorite(hash: sender.tag)
        self.tableView?.reloadData()
    }

}

extension ListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as! CommonCell
        let group = BaseViewController.contentShow.groupedBySeason()[indexPath.section + 1]
        let episode = group![indexPath.row]
        cell.fill(title: episode.name!,
                  imgUrl: episode.image.medium!,
                  episode: episode.number!,
                  season: episode.season!,
                  favorite: FavoriteMemoization.getFavorite(episode.name!.hashValue) ?? false,
                  target: self,
                  action: #selector(toggle(sender:)))
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 30)
        return SectionView(frame: frame, season: section + 1)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension ListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return BaseViewController.contentShow.groupedBySeason().count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let group = BaseViewController.contentShow.groupedBySeason()
        return group[section + 1]?.count ?? 0
    }
    
}

