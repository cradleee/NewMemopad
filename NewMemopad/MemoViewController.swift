//
//  MemoViewController.swift
//  NewMemopad
//
//  Created by kamano yurika on 2018/07/05.
//  Copyright © 2018年 釜野由里佳. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    var saveDate: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.text = saveDate.object(forKey: "title") as? String
        contentTextView.text = saveDate.object(forKey: "content") as? String
        titleTextField.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveMemo() {
        //UserDefaultに書き込み
        saveDate.set(titleTextField.text, forKey: "title")
        saveDate.set(contentTextView.text, forKey: "content")
    //alertを出す
    let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました。", preferredStyle: .alert)
    
    //OKボタン
    alert.addAction(
        UIAlertAction(
            title: "OK",
            style: .default,
            handler: { action in
                self.navigationController?.popViewController(animated: true)
                print("OKボタンが押されました！")
         }
     )
  )
    alert.addAction(UIAlertAction(
        title: "キャンセル",
        style: .cancel,
        handler: { action in
            self.navigationController?.popViewController(animated: true)
            print("キャンセルしました！")
    }
)
)
        
    present(alert, animated: true, completion: nil)
}
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

