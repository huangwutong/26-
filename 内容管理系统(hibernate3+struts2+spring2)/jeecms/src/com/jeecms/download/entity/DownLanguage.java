package com.jeecms.download.entity;

import com.jeecms.download.entity.base.BaseDownLanguage;



public class DownLanguage extends BaseDownLanguage {
	private static final long serialVersionUID = 1L;

/*[CONSTRUCTOR MARKER BEGIN]*/
	public DownLanguage () {
		super();
	}

	/**
	 * Constructor for primary key
	 */
	public DownLanguage (java.lang.Long id) {
		super(id);
	}

	/**
	 * Constructor for required fields
	 */
	public DownLanguage (
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