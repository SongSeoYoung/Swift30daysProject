## What I learned from this project❗️

👉  핵심은 RSS parsing 과 expand 한 cell 을 만드는 것이다.  
먼저 **RSS parsing** 을 하기위해 Alamofire 를 사용해서 request 에 대한 response 를 RSS 로 받아와서 데이터를 저장했다.  
<br>

**Rich Site Summary** 의 줄임말로
~~~
RSS는 어떤 사이트에 새로운 콘텐츠가 올라왔을 때 해당 사이트에 방문하지 않고, RSS서비스를 통해 리더 한 곳에서 그 콘텐츠를 이용하기 위한 방법이다. 쉽게 생각하면, 여러 언론사 사이트를 모두 방문할 필요 없이 다양한 기사를 네이버뉴스 한 곳에서 볼 수 있는 것과 같다고 보면 된다.
~~~ 

Alamofire 에서는 response 의 방법으로 따로 RSS 를 제공하지 않는 것 같았다. 그래서 ```AlamofireRSSParser``` 을 import 하여 사용했다. (사용법은 Alamofire 와 같았음)


<br>
<br>

👉  cell의 expaning 을 위해 [Project 5](https://github.com/SongSeoYoung/Swift30daysProject/tree/master/Project%2005%20-%20Artistry) 에서 다룬 내용을 참고했다. 그 당시에는 셀을 클릭했을 때에 대한 값을 bool로 따로 저장하고있었고 저장한 값의 bool 에 따라서 ```CellForRowAt``` 메서드에서 다시금 cell 의 내용을 조정해주었다.  
<br>
이번에도 마찬가지로 해당 cell 을 클릭할 때 마다 bool 값을 바꾸고 bool 에 따라서 label 의 ```numberOfLines``` 값을 조정해주었다.  
무턱대고 ```UITableView.automaticDimension``` 만 지정해줬다가는 전체 기사가 보이고 클릭시에 업데이트가되지 않는.. 원하지않은 형태를 만들 수 있으니!! 잘 생각해보고 사용해야한다.