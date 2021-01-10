## What I learned from this project❗️

👉  이 프로젝트의 핵심은 동적으로 셀의 높이를 계산해서 보여줘야했다. 처음에는 오토레이아웃을 잡아두고 `Constraint` 자체를 삭제하고 추가하면서 높이를 바꾸려고했지만.. 꽤나 오랜시간을 투자해서 했으나 조금 실패한 느낌을 받았다. (이 것이 바로 ⚒ (삽질?))  

그래서 그 다음으로 생각한게 `Compression Resistance Priority` 값을 조정해야하나..? 라고 생각해서 해당 값이 클 수록 공간이 부족할 때 본인을 의 compression 저항을 줄이니까 더 공간을 많이 먹어서 내가 원하는 값을 보여줄 수 있을 것이라고 생각했다👍

<br>
<br>

* **`UITableView.automaticDimension`** - 셀의 row Height 가 유동적임을 나타내어줄 수 있는 선언이다. 그래서 rowHeight가 지정되어있다면 이를 무시하고 유동적으로 결정할 수 있도록

<br>

* **`estimatedRowHeight`** - 예상되는 row height 값 지정. 이를 통해서 tableView 가 reload 될 때 얼만큼의 스크롤이 필요한지를 계산하기에 너무 엉뚱한 값을 주어서는 안됨 (통상적으로 스토리보드에서 작업한 row height 값을 주면될 것 같다.)

<br>

* **`beginUpdates` & `endUpdates`** - 데이터가 변해서 새로 테이블뷰를 리로드하고싶을 때 보통 `tableView.reloadData` 를 사용해주곤하는데 해당 메서드의 경우 전체 데이터자체를 다시 로드하는 것이므로 비효율적임.   
이번 프로젝트에서는 셀을 클릭하면 expanded 되어야했기 때문에 새로운 내용의 추가로 height 가 유동적으로 자주 변해야했다. TableView 의 insert, delete, reload, selection 등의 작업을 해당 메서드 사이에 넣으면! 전체를 리로드하지않아도 된다!  
메서드 사이에 오는 행위에 대한 우선순위? -> delete, reload, insert, select 순서  
<br>
그런데 iOS 11 부터는 이를 대신해서 
```swift
func performBatchUpdates(_ updates: (() -> Void)?, completion: ((Bool) -> Void)? = nil)
```  
 메서드가 추가됨. 하지만 기존 메서드자체가 deprecated 된건 아니다.

<br>

* **`scrollToRow(at:at:animated:)`** - 특정 셀로 스크롤시키는 방법. 첫 번재 파라미터에는 이동시키고싶은 위치(indexPath),  두 번째 파라미터는 해당 indexPath의 top, bottom 어디에? 세 번째는 animation이다.  
