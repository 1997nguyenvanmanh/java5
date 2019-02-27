package bean;

public class StaffPager extends Pager {

	private Integer departId;

	public StaffPager() {
	}

	public Integer getDepartId() {
		return departId;
	}

	public void setDepartId(Integer departId) {
		this.departId = departId;
	}

	@Override
	public String toString() {
		return super.toString()+"zxc StaffPager [departId=" + departId + "]";
	}

}
