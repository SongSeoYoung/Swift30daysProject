## What I learned from this project❗️

👉 이번 프로젝트는 쉬웠지만 약간의 고민이 들었던 부분이 있었다. 셀을 클릭해서 다음 뷰컨트롤러로 넘어가는 부분인데,  
셀 클릭 시 다음 뷰컨트롤러에 셀의 label text와 indexPath.row 를 넘겨줘야한다.  
처음에는 당연히 내비게이션으로 연결되어있으니 `prepare` 로 구현해야된다고 생각했다.  
<br>
```swift
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let DetailViewController: DetailViewController = segue.destination as? DetailViewController else { return }
        guard let cell: TableViewCell = sender as? TableViewCell else { return }
        let indexPath = tableView.indexPath(for: cell)
        //아래는 다음 뷰컨의 저장프로퍼티에 정보를 전달
        DetailViewController.cellImage = indexPath?.row
        DetailViewController.cellTitle = cell.cellTitle.text
    }
```
역시 원하는대로 잘 되었음. 하지만 여기서 든 의문!  
`tableView Delegate` 메서드 중 `didSelectedCell` 에서 구현해도 되지 않을까??  어차피 셀 클릭 후에 일어날 일에 대해서 구현해야되니까 해당 메서드 안에서 navigation 으로 push 하고 데이터도 넘겨줘야지!  
<br>
```swift
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.itemNumber = indexPath.row
        guard let vc: DetailViewController = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else {return}
        guard let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return }
		//다음 뷰 컨트롤러에 정보 전달
        vc.cellImage = self.itemNumber
        vc.cellTitle = cell.cellTitle.text
    }
 ```
<br>
실패다.    
<br>  


이렇게 전달하면 다음 ViewController 로 push 되는건 되지만, vc.cellImage = self.itemNumber 이런 식으로 다음 뷰를 객체로 생성해서 프로퍼티에 값을 넘겨주는 부분이 문제인 것이다.  

DetailViewController 에 가서 확인해보면 전달해준 값을 받지 못하고 nil 을 출력하는 것을 볼 수 있었다.