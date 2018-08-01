package com.jeecms.cms.action.login;

import static com.ponyjava.common.util.ComUtils.*;
import java.util.List;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jeecms.core.JeeCoreAction;
import com.jeecms.core.entity.Website;
import com.ponyjava.common.util.PwdEncoder;

@SuppressWarnings("serial")
@Scope("prototype")
@Controller("cms.adminConsoleAct")
public class AdminConsoleAct extends JeeCoreAction {
	public String index() {
		// @ TODO 检查管理员是否属于该系统。
		// 多站点管理
		websiteList = websiteMng.getListByUserId(getUserId());
		sessionAppend = ";" + JSESSION_URL + "="
				+ contextPvd.getSessionId(false);
		return INDEX;
	}

	public String main() {
		return "main";
	}

	public String left() {
		return LEFT;
	}

	public String right() {
		if (pwdEncoder.isPasswordValid(getUser().getPassword(), "password")) {
			pwdWarn = true;
		}
		props = System.getProperties();
		freeMemoery = Runtime.getRuntime().freeMemory();
		totalMemory = Runtime.getRuntime().totalMemory();
		return RIGHT;
	}

	@Autowired
	private PwdEncoder pwdEncoder;
	private String sessionAppend;
	private List<Website> websiteList;
	private Properties props;
	private long freeMemoery;
	private long totalMemory;
	private boolean pwdWarn = false;

	public String getSessionAppend() {
		return sessionAppend;
	}

	public void setSessionAppend(String sessionAppend) {
		this.sessionAppend = sessionAppend;
	}

	public List<Website> getWebsiteList() {
		return websiteList;
	}

	public void setWebsiteList(List<Website> websiteList) {
		this.websiteList = websiteList;
	}

	public Properties getProps() {
		return props;
	}

	public void setProps(Properties props) {
		this.props = props;
	}

	public long getFreeMemoery() {
		return freeMemoery;
	}

	public void setFreeMemoery(long freeMemoery) {
		this.freeMemoery = freeMemoery;
	}

	public long getTotalMemory() {
		return totalMemory;
	}

	public void setTotalMemory(long totalMemory) {
		this.totalMemory = totalMemory;
	}

	public boolean isPwdWarn() {
		return pwdWarn;
	}

	public void setPwdWarn(boolean pwdWarn) {
		this.pwdWarn = pwdWarn;
	}
}
