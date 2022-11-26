//
//  ViewController.swift
//  week4-1
//
//  Created by 이예나 on 10/12/22.
//

import UIKit
import SwipeCellKit

class notesDataModel {
    let title: String
    let time: String
    let content: String
    var isFavorite:Bool = false
    var isMuted:Bool = false
    
    init(title:String,
         time:String,
         content:String){
        self.title = title
        self.time = time
        self.content = content
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var notesTableView: UITableView!
    
    var section1noteData = [
        notesDataModel(
            title: "[캡스톤] 영상 기반 운동 동작 분석을 지원하는 스마트 미러 개발",
            time: "Wednesday",
            content: "https://in.naver.com/neltia/contents/2506748938475483"
        ),
    ]
    
    var notesData: [notesDataModel] = [
        notesDataModel(
            title: "Things to do",
            time: "Yesterday",
            content: "iOS 강의듣기"
        ),
        notesDataModel(
            title: "[캡스톤] 영상 기반 운동 동작 분석을 지원하는 스마트 미러 개발",
            time: "Wednesday",
            content: "https://in.naver.com/neltia/contents/2506748938475483"
        ),
        notesDataModel(
            title: "경력",
            time: "9/19/22",
            content: "https://yena0512.github.io/webproject/portfolio"

        ),
        notesDataModel(
            title: "예나의잡다한지식",
            time: "9/17/22",
            content: "섭씨= (화씨-30) /2"

        ),
        notesDataModel(
            title: "Artificial Intelligence 09:00 am - 10:20 am",
            time: "7/26/22",
            content: "Let us understand the steps in creating a Shell Script: "
            
        ),
        notesDataModel(
            title: "미국 Bucket-list📝",
            time: "7/24/22",
            content: "할일 - 뉴욕 메그놀리아 + 베이글"

        ),
        notesDataModel(
            title: "예나 민영 유럽여행",
            time: "7/12/22",
            content: "📍6/22 수 - 스페인: * 4시 15분 비행기 출발 -> 5시 5분 마드리드 도착"

        ),
        notesDataModel(
            title: "학업계획",
            time: "7/5/22",
            content: "The division of ICT (Information Communication Technology)"
  
        ),
        notesDataModel(
            title: "Springterm",
            time: "6/29/22",
            content: "The username/password : android/security."

        ),
        notesDataModel(
            title: "유럽여행계획",
            time: "6/21/22",
            content: "#꼭 봐야할 랜드마크도 보되, 그것 위주가 아닌 아기자기한 소도시 매력을 경험할 것"
    
        ),
        notesDataModel(
            title: "미국서부여행",
            time: "6/21/22",
            content: "11일 - 16일 (LA) 워너브로스 투어 (1시), 할리우드 사인, 그린피스 천문대 (8시)"
 
        ),
        notesDataModel(
            title: "교환학생",
            time: "5/29/22",
            content: "Tuberculosis : 결핵 "

        ),
    ]

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesData[section].title.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NotesTableViewCell", for: indexPath) as? NotesTableViewCell else { return UITableViewCell() }

        cell.delegate = self
        
        //data와 UI 연결
        
        
        if indexPath.section == 1 {
            cell.noteData = section1noteData[indexPath.row]
        } else {
            if self.notesData.count > 0 {
                cell.noteData = notesData[indexPath.row]
            }
        }
       
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Yesterday"
        case 1:
            return "Previous 7 Days"
        case 2:
            return "Previous 30 Days"
        case 3:
            return "July"
        case 4:
            return "June"
        case 5:
            return "May"
        default:
            return ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.searchBarStyle = .minimal
        notesTableView.delegate = self
        notesTableView.dataSource = self
       
    }
}

extension ViewController: SwipeTableViewCellDelegate{
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeCellKit.SwipeActionsOrientation) -> [SwipeAction]? {
        let dataItem = notesData[indexPath.row] as notesDataModel
        //let cell = tableView.cellForRow(at: indexPath) as! NotesTableViewCell
        switch orientation {
        case .left:
            let mutedAction = SwipeAction(style: .default, title: nil, handler: {
                action, indexPath in
                print("mute 액션 들어옴")
                let updatedStatus = !dataItem.isMuted
                dataItem.isMuted = updatedStatus
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6, execute: { tableView.reloadRows(at: [indexPath], with: .none)})
            })
            mutedAction.title = dataItem.isMuted ? "unmute" : "mute"
            mutedAction.backgroundColor = .systemBlue
            return [mutedAction]
        case .right:
            
            let favoriteAction = SwipeAction(style: .default, title: nil, handler: {
                action, indexPath in
                print("favorite 액션 들어옴")
                let updatedStatus = !dataItem.isFavorite
                dataItem.isFavorite = updatedStatus
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6, execute: { tableView.reloadRows(at: [indexPath], with: .none)})
            })
            favoriteAction.title = dataItem.isFavorite ? "unfavorite" : "favorite"
            favoriteAction.backgroundColor = .systemPurple
            
            let deleteAction = SwipeAction(style: .destructive, title: "Delete") {
                action,indexPath in
                self.notesData.remove(at: indexPath.row)
                self.notesTableView.deleteRows(at: [indexPath], with: .automatic)
                print("delete 액션 들어옴")
            }
            //deleteAction.image = UIImage(systemName: "trash.fill")
            deleteAction.backgroundColor = .systemRed
            deleteAction.title = "delete"
            
            return [deleteAction, favoriteAction]
        }
    }
    //expansion option 설정
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .selection
        options.transitionStyle = .drag
        return options
    }
    
}
