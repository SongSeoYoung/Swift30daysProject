import UIKit

class ViewController: UIViewController {
  @IBOutlet var tableView: UITableView!
  @IBOutlet var searchFooter: SearchFooter!
  @IBOutlet var searchFooterBottomConstraint: NSLayoutConstraint!
  
  let searchController = UISearchController(searchResultsController: nil)
  var candies: [Candy] = []
  var filteredCandies: [Candy] = []  //saving result
  var isSearchBarEmpty: Bool {
    return searchController.searchBar.text?.isEmpty ?? true
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.candies = Candy.candies()
    
    searchController.searchResultsUpdater = self      //결과 업데이트하는 메서드 프로토콜에서 받은 것 연결
    searchController.obscuresBackgroundDuringPresentation = false   //검색중인 정보가 포함된 뷰컨트롤러를 가리는 현상이 생기는데 검색 중에도 결과를 표시하고싶으면 false 를 주면된다.
    searchController.searchBar.placeholder = "Search Candies!"    //placeholder
    navigationItem.searchController = searchController    //인터페이스 빌더는 UISearchController 자체를 compatible 하게 받아들일 수 없어서 내비게이션아이템에 이를 추가해줘야한다.
    definesPresentationContext = true   //SeachController 가 활성화되어있으면서 다른 화면으로 이동하는 경우에 검색창이 화면에 남아있지 않도록하는 것.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    if let indexPath = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: indexPath, animated: true)
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard
      segue.identifier == "ShowDetailSegue",
      let indexPath = tableView.indexPathForSelectedRow,
      let detailViewController = segue.destination as? DetailViewController
      else {
        return
    }
    
    let candy = candies[indexPath.row]
    detailViewController.candy = candy
  }
  
  func filterContentForSearchText(_ searchText: String,
                                  category: Candy.Category? = nil) {
    filteredCandies = candies.filter { (candy: Candy) -> Bool in
      return candy.name.lowercased().contains(searchText.lowercased())    //캔디이름을 다 소문자로 바꾼 후에 continas 되었는지 확인하는 메서드를 수행해서 filteredCandies 에 넣음
      //그래서 apple = Apple 로 인식하게만든다.
    }
    
    tableView.reloadData()
  }


}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return candies.count
  }
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                             for: indexPath)
    let candy = candies[indexPath.row]
    cell.textLabel?.text = candy.name
    cell.detailTextLabel?.text = candy.category.rawValue
    return cell
  }
}

extension ViewController: UISearchResultsUpdating{
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar    //searchBar 를 만들고
    filterContentForSearchText(searchBar.text!)   //필터링하는 커스텀 메서드 실행
  }
  
  
}
