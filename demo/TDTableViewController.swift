//
//  TDTableViewController.swift
//  Example Project
//
//  Created by yen on 2/28/24.
//

import UIKit

import ToDwoong

class TDTableViewController: UIViewController {
    
    // MARK: - Properties
    
    private var todoItems: [TodoModel] = [
        TodoModel(id: "1", title: "프레임워크 마무리", place: nil, dueDate: nil, dueTime: nil, isCompleted: false, placeAlarm: false, timeAlarm: false, category: "식당"),
        TodoModel(id: "2", title: "프레임워크 마무리", place: nil, dueDate: Date(), dueTime: nil, isCompleted: false, placeAlarm: false, timeAlarm: false, category: nil),
        TodoModel(id: "3", title: "프레임워크 마무리", place: nil, dueDate: Date(), dueTime: Date(), isCompleted: false, placeAlarm: false, timeAlarm: true, category: "직장"),
        TodoModel(id: "4", title: "프레임워크 마무리", place: "경기도 수원시 팔달구 경수대로 420", dueDate: Date(), dueTime: Date(), isCompleted: false, placeAlarm: true, timeAlarm: false, category: nil),
        TodoModel(id: "5", title: "프레임워크 마무리", place: "경기도 수원시 팔달구 경수대로 420", dueDate: Date(), dueTime: Date(), isCompleted: false, placeAlarm: true, timeAlarm: true, category: "학교")
    ]
    
    // MARK: - UI Properties
    
    private var tableView: UITableView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray2
        
        setTableView()
    }
    
    private func setTableView() {
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(TDTableViewCell.self, forCellReuseIdentifier: TDTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}

// MARK: - Extensions

extension TDTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TDTableViewCell.identifier, for: indexPath) as? TDTableViewCell else {
            return UITableViewCell()
        }
        
        let todoItem = todoItems[indexPath.row]
        cell.configure(data: todoItem)
        cell.onCheckButtonTapped = {
            print("투두 완료 버튼 체크")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, completionHandler) in
            
            self?.todoItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
