package bean;

import java.util.Date;
import java.util.Map;

public class Cake {

	private int cakeId; // 商品编号
	private String cakeName; //  商品名称
	private double price; // 价格
	private String description; // 描述信息
	private int catalogId; //商品分类id
	private int imgId; // 图片id
	private Date addTime;//上架时间

	private Catalog catalog = new Catalog(); // ��Ʒ��������
	private UpLoadImg upLoadImg = new UpLoadImg(); // ͼƬ������

	public Cake() {
	}

	// �����Ǵ����ݿ��ȡʱ����ת����
	public Cake(Map<String, Object> map) {
		this.cakeId = (int) map.get("cakeId");
		this.cakeName = (String) map.get("cakeName");
		this.price = (double) map.get("price");
		this.description = (String) map.get("description");
		this.addTime=(Date) map.get("addTime");
		this.catalog = new Catalog(map);
		this.upLoadImg = new UpLoadImg(map);
	}

	public int getCakeId() {
		return cakeId;
	}

	public void setCakeId(int cakeId) {
		this.cakeId = cakeId;
	}

	public String getCakeName() {
		return cakeName;
	}

	public void setCakeName(String cakeName) {
		this.cakeName = cakeName;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getCatalogId() {
		return catalogId;
	}

	public void setCatalogId(int catalogId) {
		this.catalogId = catalogId;
	}

	public int getImgId() {
		return imgId;
	}

	public void setImgId(int imgId) {
		this.imgId = imgId;
	}

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public Catalog getCatalog() {
		return catalog;
	}

	public void setCatalog(Catalog catalog) {
		this.catalog = catalog;
	}

	public UpLoadImg getUpLoadImg() {
		return upLoadImg;
	}

	public void setUpLoadImg(UpLoadImg upLoadImg) {
		this.upLoadImg = upLoadImg;
	}

	@Override
	public String toString() {
		return "Cake [cakeId=" + cakeId + ", cakeName=" + cakeName + ", price=" + price + ", description=" + description
				+ ", catalogId=" + catalogId + ", imgId=" + imgId + ", addTime=" + addTime + ", catalog=" + catalog
				+ ", upLoadImg=" + upLoadImg + "]";
	}

	

	



}
