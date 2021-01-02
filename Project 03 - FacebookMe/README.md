## What I learned from this project❗️

👉 이번에는 Custom Cell 을 총 3개를 사용해서 프로젝트를 만드는 것이었다. custom cell 3개와 섹션 구분이 핵심이다. 새로 알게된 점에 대해 정리해보고자한다.  
<br>

먼저 **tableView 에서 section을 나눠서 header를 넣어주면 header가 포함하는 cell들 사이를 스크롤 할 때 아래처럼 헤더가 위에 fix** 되어있다. 하지만 내가 원하는 것은 위에 고정되지않아야한다는 점.
<br>

<img src = "https://user-images.githubusercontent.com/42825223/103457991-25600a80-4d47-11eb-9e72-1c71ed2d105f.gif" width="130"> 👈 section header 고정  -----------  section header 고정x    👉 <img src ="https://user-images.githubusercontent.com/42825223/103457906-6dcaf880-4d46-11eb-88df-b9ea8d407d56.gif" width="130"></img> 
<br>
<br>

이를 구현하기 위해서 구글링을 해보니! 아래의 내용을 수정해야했다.  
<br>

<img src = "https://user-images.githubusercontent.com/42825223/103458042-a7e8ca00-4d47-11eb-966b-0f2e009e9490.png" width="250">  

TableView 의 style 을 보면 default 한 값으로 "Plain" 이 지정되어있는데 스타일 자체를 **"Grouped"** 로 바꿔주면 전체 셀들이 하나의 그룹이 되면서 헤더가 움직이지않는 효과를 나타낼 수 있는 것 같다. 
<br>
<br>
그리고 사실은 profile 나타내는 cell이나 image-label 로 구성된 cell 들이 비슷한 구성을 가지기때문에 해당 부분을 셀 하나로 `reuseable`하게 사용해도 될 것 같은데 (코드로 auto layout을 잡아서!)... 참고할만한 코드가 없다ㅜ 어떤게 메모리를 절약할 수 있는 방법인지 조금 더 고민해봐야될 것 같다 🙂