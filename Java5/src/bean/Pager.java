package bean;

public class Pager {

	private int displayPerPage = 10;
	private int currentPage = 1;
	private int totalResult = 0;
	private String orderColumn = "";
	private String keyword = "";
	private boolean asc = true;
	
	
	
	public Pager() {
	}


	public Pager(int displayPerPage, int currentPage, int totalResult, String orderColumn, String keyword,
			boolean asc) {
		super();
		this.displayPerPage = displayPerPage;
		this.currentPage = currentPage;
		this.totalResult = totalResult;
		this.orderColumn = orderColumn;
		this.keyword = keyword;
		this.asc = asc;
	}


	public int getDisplayPerPage() {
        return displayPerPage;
    }

    public void setDisplayPerPage(int displayPerPage) {
        this.displayPerPage = displayPerPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getTotalResult() {
        return totalResult;
    }

    public void setTotalResult(Integer totalResult) {
        this.totalResult = totalResult;
    }

    public boolean getAsc() {
        return asc;
    }

    public void setAsc(boolean asc) {
        this.asc = asc;
    }

    public String getOrderColumn() {
        return orderColumn;
    }

    public void setOrderColumn(String orderColumn) {
        this.orderColumn = orderColumn;
    }

    public int getTotalPage() {
        return totalResult % displayPerPage > 0 ? totalResult / displayPerPage + 1 : totalResult / displayPerPage;
    }    

    public int getFirstResult() {
        return (currentPage - 1) * displayPerPage;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }


	@Override
	public String toString() {
		return "Pager [displayPerPage=" + displayPerPage + ", currentPage=" + currentPage + ", totalResult="
				+ totalResult + ", orderColumn=" + orderColumn + ", keyword=" + keyword + ", asc=" + asc + "]";
	}
    
}
