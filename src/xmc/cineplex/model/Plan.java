package xmc.cineplex.model;


import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="screeningplan")
public class Plan  implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@GenericGenerator(name = "paymentableGenerator", strategy = "native")
	private Integer id;
	private String title;
	private String director;
	private String type;
	private String language;
	private String duration;
	private String firstRunTime;
	private Date airTime;
	private Date endTime;
	private double price;
	private int hallNumber;
	private String posturl;
	private int state;                    //0代表待审核1代表通过审核-1代表未通过审核 2代表已经上映过了
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getFirstRunTime() {
		return firstRunTime;
	}
	public void setFirstRunTime(String firstRunTime) {
		this.firstRunTime = firstRunTime;
	}
	public Date getAirTime() {
		return airTime;
	}
	public void setAirTime(Date airTime) {
		this.airTime = airTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getHallNumber() {
		return hallNumber;
	}
	public void setHallNumber(int hallNumber) {
		this.hallNumber = hallNumber;
	}
	public String getPosturl() {
		return posturl;
	}
	public void setPosturl(String posturl) {
		this.posturl = posturl;
	}
}
