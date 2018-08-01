package com.jeecms.template;

import com.ponyjava.common.developer.ModuleGenerator;

public class CmsModuleGenerator {
	private static String packName = "com.jeecms.template";
	private static String fileName = "config_cms.properties";

	public static void main(String[] args) {
		new ModuleGenerator(packName, fileName).generate();
	}
}
