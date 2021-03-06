package com.accp.myoa.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Meeting generated by MyEclipse Persistence Tools
 */

public class Meeting implements java.io.Serializable {

	// Fields

	private Integer meetingId;
	private ExamineState examineState;
	private BoardRoom boardRoom;
	private User userByExaminer;
	private User userByUserId;
	private Meetingstate meetingstate;
	private String meetingTitle;
	private String meetingContent;
	private String meetingTime;
	private String startTime;
	private String endTime;
	private String outUser;
	private Set meetingSummaries = new HashSet(0);
	private Set meetingReads = new HashSet(0);

	// Constructors

	/** default constructor */
	public Meeting() {
		examineState=new ExamineState();
		boardRoom=new BoardRoom();
		userByExaminer=new User();
		userByUserId=new User();
		meetingstate=new Meetingstate();
	}

	/** minimal constructor */
	public Meeting(ExamineState examineState, BoardRoom boardRoom,
			User userByExaminer, User userByUserId, Meetingstate meetingstate,
			String meetingTitle, String meetingContent, String startTime,
			String endTime) {
		this.examineState = examineState;
		this.boardRoom = boardRoom;
		this.userByExaminer = userByExaminer;
		this.userByUserId = userByUserId;
		this.meetingstate = meetingstate;
		this.meetingTitle = meetingTitle;
		this.meetingContent = meetingContent;
		this.startTime = startTime;
		this.endTime = endTime;
	}

	/** full constructor */
	public Meeting(ExamineState examineState, BoardRoom boardRoom,
			User userByExaminer, User userByUserId, Meetingstate meetingstate,
			String meetingTitle, String meetingContent, String meetingTime,
			String startTime, String endTime, String outUser, Set meetingSummaries,
			Set meetingReads) {
		this.examineState = examineState;
		this.boardRoom = boardRoom;
		this.userByExaminer = userByExaminer;
		this.userByUserId = userByUserId;
		this.meetingstate = meetingstate;
		this.meetingTitle = meetingTitle;
		this.meetingContent = meetingContent;
		this.meetingTime = meetingTime;
		this.startTime = startTime;
		this.endTime = endTime;
		this.outUser = outUser;
		this.meetingSummaries = meetingSummaries;
		this.meetingReads = meetingReads;
	}

	// Property accessors

	public Integer getMeetingId() {
		return this.meetingId;
	}

	public void setMeetingId(Integer meetingId) {
		this.meetingId = meetingId;
	}

	public ExamineState getExamineState() {
		return this.examineState;
	}

	public void setExamineState(ExamineState examineState) {
		this.examineState = examineState;
	}

	public BoardRoom getBoardRoom() {
		return this.boardRoom;
	}

	public void setBoardRoom(BoardRoom boardRoom) {
		this.boardRoom = boardRoom;
	}

	public User getUserByExaminer() {
		return this.userByExaminer;
	}

	public void setUserByExaminer(User userByExaminer) {
		this.userByExaminer = userByExaminer;
	}

	public User getUserByUserId() {
		return this.userByUserId;
	}

	public void setUserByUserId(User userByUserId) {
		this.userByUserId = userByUserId;
	}

	public Meetingstate getMeetingstate() {
		return this.meetingstate;
	}

	public void setMeetingstate(Meetingstate meetingstate) {
		this.meetingstate = meetingstate;
	}

	public String getMeetingTitle() {
		return this.meetingTitle;
	}

	public void setMeetingTitle(String meetingTitle) {
		this.meetingTitle = meetingTitle;
	}

	public String getMeetingContent() {
		return this.meetingContent;
	}

	public void setMeetingContent(String meetingContent) {
		this.meetingContent = meetingContent;
	}

	public String getMeetingTime() {
		return this.meetingTime;
	}

	public void setMeetingTime(String meetingTime) {
		this.meetingTime = meetingTime;
	}

	public String getStartTime() {
		return this.startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return this.endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getOutUser() {
		return this.outUser;
	}

	public void setOutUser(String outUser) {
		this.outUser = outUser;
	}

	public Set getMeetingSummaries() {
		return this.meetingSummaries;
	}

	public void setMeetingSummaries(Set meetingSummaries) {
		this.meetingSummaries = meetingSummaries;
	}

	public Set getMeetingReads() {
		return this.meetingReads;
	}

	public void setMeetingReads(Set meetingReads) {
		this.meetingReads = meetingReads;
	}

}