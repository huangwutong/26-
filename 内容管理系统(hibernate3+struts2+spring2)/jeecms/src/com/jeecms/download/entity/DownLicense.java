package com.jeecms.download.entity;

import com.jeecms.download.entity.base.BaseDownLicense;



public class DownLicense extends BaseDownLicense {
	private static final long serialVersionUID = 1L;

/*[CONSTRUCTOR MARKER BEGIN]*/
	public DownLicense () {
		super();
	}

	/**
	 * Constructor for primary key
	 */
	public DownLicense (java.lang.Long id) {
		super(id);
	}

	/**
	 * Constructor for required fields
	 */
	public DownLicense (
		java.lang.Long id,
		com.jeecms.core.entity.Website website,
		java.lang.Boolean disabled) {

		super (
			id,
			website,
			disabled);
	}

/*[CONSTRUCTOR MARKER END]*/


}