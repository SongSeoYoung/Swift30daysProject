## What I learned from this project❗️

👉 UISCrollView 에대해 다뤄본 적 있다면 쉽게 할 수 있는 것 같다.  

Xcode 11 에서 인터페이스빌더로 ScrollView 를 만드는 방법? 이 조금 더 편리하게되었다. 스크롤 뷰 UI 생성시에 기본적으로 Content Layout Guides 가 활성화되어있다.  
<br>

> 💡 **content Layout Guide** : <u>**ScrollView 의 컨텐츠 영역**</u> 과 관련된 레이아웃을 만들 때 사용한다. 기본적인 사용으로는 스크롤 뷰 전체의 top bottom trailing leading 에 대한 오토레이아웃을 content layout guide 에다가 걸어주는 것을 말한다.  

> 💡 **frame Layout Guide** : <u>**ScrollView 자체의 프레임**</u> 에 대한 것으로 가로스크롤링을 원하면 eqauls Height 를 해야겠지?

<br>

<br>


이런 개념들을 이용해서 각 imageView 에 대해 layout을 적용해서 가로스크롤링을 구현했다. 원하는대로 나오긴했는데..아래와 같은 차이점이 있음을 알게되었다.  

<br>

|  Paging Enable 활성화 ❌  |  |Paging Enable 활성화 ⭕️  |
|:-------:|:------:|:-----:|
|<img src="https://user-images.githubusercontent.com/42825223/107879737-fc25c300-6f1d-11eb-8e4a-81531f1c0770.gif" width = 200> | |<img src="https://user-images.githubusercontent.com/42825223/107873942-7263fe80-6ef9-11eb-83b4-b01e36065146.gif" width = 200>|

<br>
<br>

페이징을 해야지 화면이 페이징으로 넘어간다. 활성화하지않으면 그냥 x 값이 이동하는 느낌으로 스크롤링이 진행됨을 알 수 있었음.  