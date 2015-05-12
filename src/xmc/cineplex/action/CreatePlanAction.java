package xmc.cineplex.action;

import java.io.File;


import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xmc.cineplex.model.Plan;
import xmc.cineplex.service.PlanService;

import com.opensymphony.xwork2.Action;
@Repository
public class CreatePlanAction extends BaseAction implements Action{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private PlanService planService;
	private Plan plan;
	private String airTime;
	private String endTime;
	private String hall;
	private String price;
	
	private File uploadFile;
	private String uploadFileContentType;
	private String uploadFileFileName;



	public String execute() throws Exception {
		/**
		 * 将输入结果进行一些转换
		 */
		SimpleDateFormat sim= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		System.out.println(airTime+"~~~~~~~~~~~~~~~~~");
		
		Date t=sim.parse(airTime);
		
		System.out.println(t+"~~~~~~~~~~~~~~~~~");
		
		plan.setAirTime(t);
		t=sim.parse(endTime);
		plan.setEndTime(t);
		Double iPrice=Double.parseDouble(price);
		plan.setPrice(iPrice);
		int iHallNumber=Integer.parseInt(hall);
		plan.setHallNumber(iHallNumber);
		plan.setState(0);
		
		/**上传电影海报*/
		
		String RealPath="E:/xmc_Code/JavaEE/Cineplex_/WebContent/post";
		
		File file=new File(RealPath);
		
		if(!file.exists()){
			file.mkdirs();
		}
		
		FileUtils.copyFile(uploadFile, new File(file,uploadFileFileName));//上传海报
		String path="post/"+uploadFileFileName;
		plan.setPosturl(path);
		planService.createNewPlan(plan);
		return SUCCESS;
	}
	
	public String enterCreatePlan(){
		return SUCCESS;
	}
	
	
	public String getAirTime() {
		return airTime;
	}


	public void setAirTime(String airTime) {
		this.airTime = airTime;
	}


	public String getEndTime() {
		return endTime;
	}


	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}


	public String getHall() {
		return hall;
	}


	public void setHall(String hall) {
		this.hall = hall;
	}



	public Plan getPlan() {
		return plan;
	}


	public void setPlan(Plan plan) {
		this.plan = plan;
	}


	public String getPrice() {
		return price;
	}


	public void setPrice(String price) {
		this.price = price;
	}

	public File getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(File uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getUploadFileContentType() {
		return uploadFileContentType;
	}

	public void setUploadFileContentType(String uploadFileContentType) {
		this.uploadFileContentType = uploadFileContentType;
	}

	public String getUploadFileFileName() {
		return uploadFileFileName;
	}

	public void setUploadFileFileName(String uploadFileFileName) {
		this.uploadFileFileName = uploadFileFileName;
	}
	
	
}
