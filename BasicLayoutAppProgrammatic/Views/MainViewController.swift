//
//  MainViewController.swift
//  BasicLayoutAppProgrammatic
//
//  Created by Raul Barranco on 7/12/22.
//

import UIKit

class MainViewController: UIViewController {

    lazy var table: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemRed
        table.dataSource = self
        table.delegate = self
        table.register(ProgTableViewCell.self, forCellReuseIdentifier: ProgTableViewCell.reuseId)
        return table
    }()
    
    var topTexts: [String] = ["147_Dratini", "148_Dragonair", "371_Bagon", "372_Shelgon", "610_Axew", "611_Fraxure", "612_Haxorus", "621_Druddigon", "704_Goomy", "705_Sliggoo", "706_Goodra", "782_Jangmo-o", "895_Regidrago"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpUI()
        
    }
    
    private func setUpUI() {
        
        self.view.backgroundColor = .white
        self.title = "Dragon List"
        self.view.addSubview(self.table)
        self.table.bindToSuperView()
        
    }

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.topTexts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProgTableViewCell.reuseId, for: indexPath) as? ProgTableViewCell else {return UITableViewCell()}
        
        cell.progTopLabel.text = self.topTexts[indexPath.row]
        cell.progMidLabel.text = "Middle"
        cell.progBottomLabel.text = "Bottom"
        
        //cell.progImageView.image = UIImage(named: "whitedragon")
        
        switch indexPath.row {
            
        case 0:
            cell.progImageView.image = UIImage(named: "147_Dratini")
        case 1:
            cell.progImageView.image = UIImage(named: "148_Dragonair")
        case 2:
            cell.progImageView.image = UIImage(named: "371_Bagon")
        case 3:
            cell.progImageView.image = UIImage(named: "372_Shelgon")
        case 4:
            cell.progImageView.image = UIImage(named: "610_Axew")
        case 5:
            cell.progImageView.image = UIImage(named: "611_Fraxure")
        case 6:
            cell.progImageView.image = UIImage(named: "612_Haxorus")
        case 7:
            cell.progImageView.image = UIImage(named: "621_Druddigon")
        case 8:
            cell.progImageView.image = UIImage(named: "704_Goomy")
        case 9:
            cell.progImageView.image = UIImage(named: "705_Sliggoo")
        case 10:
            cell.progImageView.image = UIImage(named: "706_Goodra")
        case 11:
            cell.progImageView.image = UIImage(named: "782_Jangmo-o")
        case 12:
            cell.progImageView.image = UIImage(named: "895_Regidrago")
                                               
           default:
            cell.progImageView.image = UIImage(named: "bluedragon")
        }
        
        return cell
        
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let detailVC = DetailViewController()
        let detailVC = DetailViewController(text: self.topTexts[indexPath.row])
        self.navigationController?.pushViewController(detailVC, animated: true)
        self.navigationController?.navigationBar.tintColor = .white
    }
    
}
