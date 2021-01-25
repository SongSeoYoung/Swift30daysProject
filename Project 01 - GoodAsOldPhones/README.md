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

이 것도 가능하다.  

<br>  

처음에는 안되는 줄 알았는데 이 부분이 궁금해서 동아리에서 물어보니! 스토리보드에서 segue로 연결해준 경우에는 바로 ```prepare``` 메서드에서 작성해줄 수 있고, 만약 그런게 아니라면 ```didSelectRowAt``` ```delegate``` 메서드 안에서 따로 지정해서 ```navigation push``` 해주면 된다.!  

**만약 우리가 스토리보드에서도 ```segue```로 연결했는데 ```didSelectRowAt``` 에서 푸시하는 방식으로 코드를 작성해준다면, ```didSelectRowAt``` -> ```prepare``` 순으로 코드가 진행된다고한다.**  

<br>

그럼 언제 어떤 메서드에서 이를 구현해야하는가?? 에 대해서도 궁금했는데, ```cell``` 의 ```indexPath``` 와 같은 정보를 넘겨줘야하는 경우는 아무래도 ```delegate method``` 안에 구현되어있는 ```didSelectRowAt``` 을 이용하면, 파라미터로 받는 ```indexPath``` 값을 따로 인스턴스화시켜서 사용하지 않아도되는 편리함이 있어서 셀에 대한 정보는 ```didSelectRowAt``` 에서 데이터를 넘기는 듯 하다. 

하지만 우리가 현재 보고있는 페이지에 대한 정보를 넘겨야하는 경우에는 아무래도 ```tableView``` 에 대한 내용이 아니라 전체적인 내용이다보니 ```navigation``` 을 위한 ```prepare method``` 를 ```override``` 해서 사용하는 것 같다. 👍 새로운 배움 👍