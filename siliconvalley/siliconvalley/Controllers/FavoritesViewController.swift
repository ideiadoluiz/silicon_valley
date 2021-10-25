//
//  FavoritesViewController.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-25.
//

import UIKit

class FavoritesViewController: BaseViewController {

    private weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView?.reloadData()
    }
    
    override func setupUI() {
        super.setupUI()
        
        self.createTableView()
    }
    
    private func createTableView() {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        
        UIView.addFitContraints(to: tableView, from: view)
        tableView.register(CommonCell.self, forCellReuseIdentifier: "episodeCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView = tableView
    }
    
    @objc func toggle(sender: UIButton) {
        self.toggleIsFavorite(hash: sender.tag)
        self.tableView?.reloadData()
    }

}

extension FavoritesViewController : UITableViewDelegate {
    func filter(section: Int) -> [Episode] {
        let group = BaseViewController.contentShow.groupedBySeason()
        let filter = group[section + 1]?.filter({ ep in
            FavoriteMemoization.getFavorite(ep.name!.hashValue) ?? false
        })
        return filter!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as! CommonCell
        let group = filter(section: indexPath.section)
        let episode = group[indexPath.row]
        cell.fill(title: episode.name!,
                  imgUrl: episode.image.medium!,
                  episode: episode.number!,
                  season: episode.season!,
                  favorite: FavoriteMemoization.getFavorite(episode.name!.hashValue) ?? false,
                  target: self,
                  action: #selector(toggle(sender:)))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let group = filter(section: indexPath.section)
        let episode = group[indexPath.row]
        self.pushDetailsController(episode: episode)
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

extension FavoritesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return BaseViewController.contentShow.groupedBySeason().count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let group = filter(section: section)
        return group.count
    }

}
