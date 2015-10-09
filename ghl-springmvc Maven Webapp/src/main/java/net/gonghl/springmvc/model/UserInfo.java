package net.gonghl.springmvc.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;


@Entity
@Table(name="bsp_user_inf",catalog="",schema="") 
@DynamicInsert(true)
@DynamicUpdate(true)
public class UserInfo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO, generator="")
	@Column(name="INT_USER_ID", columnDefinition="Long", nullable=false) 
	private Long userId;
	
	@Column(name="INT_GROUP_ID", columnDefinition="Long default 1", length=11, nullable=false)
	private Long groupId;
	
	@Column(name="VC_USER_TYPE", columnDefinition="String default 0", length=1,  nullable=false) 
	private String userType;
	
	@Column(name="VC_USERNAME", nullable=false, length=20) 
	private String username;
	
	@Column(name="VC_PASSWORD", nullable=false, length=32) 
	private String password;
	
	@Column(name="VC_REALNAME", nullable=true, length=50) 
	private String realname;
	
	@Column(name="VC_SEX_FLAG", nullable=true, length=1) 
	private String sexFlag;
	
	@Column(name="VC_EMAIL_ADDR", nullable=true, length=100) 
	private String emailAddr;
	
	@Column(name="VC_TELEPHONE_NO", nullable=true, length=20) 
	private String telephoneNo;
	
	@Column(name="DT_CREATE_TIME", nullable=true, columnDefinition="TIMESTAMP") 
	private Timestamp createTime;
	
	@Column(name="DT_UPDATE_TIME", nullable=true, columnDefinition="TIMESTAMP") 
	private Timestamp updateTime;
	
	@Column(name="VC_USER_STATUS", nullable=true, length=1) 
	private String userStatus;


	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}


	public Long getGroupId() {
		return groupId;
	}

	public void setGroupId(Long groupId) {
		this.groupId = groupId;
	}


	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	@Column(name="VC_SEX_FLAG", nullable=true, length=1) 
	public String getSexFlag() {
		return sexFlag;
	}

	public void setSexFlag(String sexFlag) {
		this.sexFlag = sexFlag;
	}

	@Column(name="VC_EMAIL_ADDR", nullable=true, length=100) 
	public String getEmailAddr() {
		return emailAddr;
	}

	public void setEmailAddr(String emailAddr) {
		this.emailAddr = emailAddr;
	}

	@Column(name="VC_TELEPHONE_NO", nullable=true, length=20) 
	public String getTelephoneNo() {
		return telephoneNo;
	}

	public void setTelephoneNo(String telephoneNo) {
		this.telephoneNo = telephoneNo;
	}

	@Column(name="DT_CREATE_TIME", nullable=true, columnDefinition="TIMESTAMP") 
	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	@Column(name="DT_UPDATE_TIME", nullable=true, columnDefinition="TIMESTAMP") 
	public Timestamp getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name="VC_USER_STATUS", nullable=true, length=1) 
	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

}