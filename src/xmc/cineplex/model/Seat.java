package xmc.cineplex.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="seat")
public class Seat {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@GenericGenerator(name = "paymentableGenerator", strategy = "native")
	private Integer id;
	private Integer pid;
	private String state;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	public String getBooked(){
		char[] ch=state.toCharArray();
		String result="[";
		int j;
		for(j=99;j>=0;j--){
			if(ch[j]=='y'){
				break;
			}
		}
		
		if(j==-1){    //如果是空场
			result="[]";
			return result;
		}
				
		for(int i=0;i<j;i++){   //如果不是空场
			if(ch[i]=='y'){
				int row=i/10+1;
				int col=i-(row-1)*10+1;
				String s="'"+row+"_"+col+"',";
				result+=s;
			}			
		}
		
		int row_=j/10+1;
		int col_=j-(row_-1)*10+1;
		String s_="'"+row_+"_"+col_+"']";
		result+=s_;
		
		return result;
	}
	
	public void setBook(int row,int col){
		int total=(row-1)*10+col-1;
		char[] ch=this.state.toCharArray();
		ch[total]='y';
		String state_=String.valueOf(ch);
		this.state=state_;
	}
	
	public void initState(){  //将售票情况初始化
		char[] ch= new char[100];
		for(int i=0;i<100;i++){
			ch[i]='n';
		}
		String state_=String.valueOf(ch);
		this.state=state_;
	}
	
}
