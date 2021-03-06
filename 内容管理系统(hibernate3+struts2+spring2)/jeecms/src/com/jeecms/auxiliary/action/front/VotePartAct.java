package com.jeecms.auxiliary.action.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jeecms.auxiliary.AuxiPartAction;
import com.jeecms.auxiliary.entity.VoteTopic;
import com.jeecms.auxiliary.manager.VoteTopicMng;

@Scope("prototype")
@Controller("auxiliary.votePartAct")
public class VotePartAct extends AuxiPartAction {
	public String voteTopic() {
		if (topicId < 0) {
			bean = voteTopicMng.getCurrentTopic(getWebId());
		} else {
			bean = voteTopicMng.findById(topicId);
		}
		return handleResult("VoteTopic");
	}

	@Autowired
	private VoteTopicMng voteTopicMng;
	private Long topicId;
	private VoteTopic bean;

	public Long getTopicId() {
		return topicId;
	}

	public void setTopicId(Long topicId) {
		this.topicId = topicId;
	}

	public VoteTopic getBean() {
		return bean;
	}

	public void setBean(VoteTopic bean) {
		this.bean = bean;
	}
}
